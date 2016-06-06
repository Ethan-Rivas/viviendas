class RemoveFieldsFromSettlements < ActiveRecord::Migration
  def change
    remove_column :settlements, :uno, :string
    remove_column :settlements, :dos, :string
    remove_column :settlements, :tres, :string
  end
end
