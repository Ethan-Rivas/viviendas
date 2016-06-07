class AddFieldsToSettlements < ActiveRecord::Migration
  def change
    add_column :settlements, :owner_name, :string
    add_column :settlements, :address, :string
    add_column :settlements, :geo_x, :float
    add_column :settlements, :geo_y, :float
    add_column :settlements, :check_1, :boolean
    add_column :settlements, :check_2, :boolean
    add_column :settlements, :check_3, :boolean
    add_column :settlements, :check_4, :boolean
    add_column :settlements, :check_5, :boolean
    add_column :settlements, :check_6, :boolean
    add_column :settlements, :check_7, :boolean
    add_column :settlements, :check_8, :boolean
    add_column :settlements, :check_9, :boolean
    add_column :settlements, :check_10, :boolean
  end
end
