class Settlement < ActiveRecord::Base
  has_many :progress_inputs
  has_many :progress_checks, :through => :progress_inputs

  has_many :pictures
  belongs_to :contract
  belongs_to :package

  belongs_to :town
  delegate :name, to: :town, prefix: true, allow_nil: true
  alias_method :municipio, :town_name

  before_validation Proc.new { |settlement|
    settlement.owner_name = I18n.transliterate(owner_full_name)
  }, on: :create
  fuzzily_searchable :owner_name

  def as_json(options = {})
    super(methods: :items)
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
