class RemoveContractIdFromSettlement < ActiveRecord::Migration
  def change
    remove_column :settlements, :contract_id, :integer
  end
end
