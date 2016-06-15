class AddContractToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :contract_id, :string
  end
end
