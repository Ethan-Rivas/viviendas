class AddKmlFileIdToKmlSettlements < ActiveRecord::Migration
  def change
    add_column :kml_settlements, :kml_file_id, :integer
    add_index :kml_settlements, :kml_file_id
  end
end
