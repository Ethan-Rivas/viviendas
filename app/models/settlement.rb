class Settlement < ActiveRecord::Base
  has_many :progress_inputs
  has_many :progress_checks, :through => :progress_inputs

  has_many :pictures
  belongs_to :contract
  belongs_to :package

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
end
