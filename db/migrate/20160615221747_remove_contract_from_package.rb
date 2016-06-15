class RemoveContractFromPackage < ActiveRecord::Migration
  def change
    remove_column :packages, :contract_id, :string
  end
end
