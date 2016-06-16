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
    (1..10).select do |i|
      attributes["check_#{i}"]
    end.count
  end
end
