class RemoveContractIdFromSettlement < ActiveRecord::Migration
  def change
    remove_column :settlements, :contract_id, :string
  end
end
