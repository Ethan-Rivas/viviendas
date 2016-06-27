class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name
    end

    add_column :settlements, :town_id, :integer
    add_column :kml_files, :town_id, :integer
  end
end
