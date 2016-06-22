class RemoveChecksFromSettlement < ActiveRecord::Migration
  def change
    remove_column :settlements, :check_1, :boolean
    remove_column :settlements, :check_2, :boolean
    remove_column :settlements, :check_3, :boolean
    remove_column :settlements, :check_4, :boolean
    remove_column :settlements, :check_5, :boolean
    remove_column :settlements, :check_6, :boolean
    remove_column :settlements, :check_7, :boolean
    remove_column :settlements, :check_8, :boolean
    remove_column :settlements, :check_9, :boolean
    remove_column :settlements, :check_10, :boolean
  end
end
