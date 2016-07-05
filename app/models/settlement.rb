class Settlement < ActiveRecord::Base
  has_many :progress_inputs
  has_many :progress_checks, :through => :progress_inputs

  has_many :pictures
  belongs_to :package
  has_many :contracts, through: :package

  belongs_to :town
  delegate :name, to: :town, prefix: true, allow_nil: true
  alias_method :municipio, :town_name

  before_validation Proc.new { |settlement|
    settlement.owner_name = I18n.transliterate(owner_full_name)
  }, on: :create
  fuzzily_searchable :owner_name

  before_create :sign_contract, if: proc { |settlement| settlement.package.present? }

  validates :nombre,           presence: true
  validates :apellido_paterno, presence: true
  validates :apellido_materno, presence: true
  validates :town,             presence: true

  def as_json(options = {})
    super(methods: :items).merge({
      geo_x: geo_y,
      geo_y: geo_x
    })
  end

  def municipio=(name)
    self.town = Town.find_or_create_by({ name: name })
  end

  def contract_name=(name)
    self.contract_id = Contract.find_or_create_by({name: name}).id
  end

  def progress
    progress_inputs.all.map do |input|
      input.progress_check.value * input.progress / 100.0
    end.sum
  end

  def owner_full_name
    [nombre, apellido_paterno, apellido_materno].join(' ')
  end

  def a_paterno=(value)
    self.apellido_paterno = value
  end

  def a_materno=(value)
    self.apellido_materno = value
  end

  def numero=(value)
    self.telefono = value
  end

  def latitud=(value)
    self.geo_y = value
  end

  def longitud=(value)
    self.geo_x = value
  end

  def constructor=(value)
    return if value.blank?

    @company = Company.find_or_create_by(name: value)
  end

  def licitacion=(value)
    return if value.blank?

    @contract = Contract.find_or_create_by(name: value)
    self.package = @contract.package
  end

  def sign_contract
    @contract.update_attribute :company, @company
  end

  def items
    ProgressCheck.all.map do |item|
      {
        id: item.id,
        name: item.name,
        value: progress_for(item)
      }
    end
  end

  def progress_for(item)
    progress_inputs.find_or_initialize_by(progress_check_id: item.id).progress
  end
end
