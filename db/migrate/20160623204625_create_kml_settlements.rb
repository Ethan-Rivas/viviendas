class CreateKmlSettlements < ActiveRecord::Migration
  def change
    create_table :kml_settlements do |t|
      t.string :name
      t.float :geo_x
      t.float :geo_y
      t.integer :settlement_id
    end
  end
end
