class AddContractToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :contract_id, :integer
  end
end
