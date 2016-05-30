class Settlement < ActiveRecord::Base
  belongs_to :contract
  def contract_name=(name)
    self.contract_id = Contract.find_or_create_by({name: name}).id
  end
end
