class CreateKmlOptions < ActiveRecord::Migration
  def change
    create_table :kml_options do |t|
      t.integer :kml_settlement_id
      t.integer :settlement_id
      t.integer :accuracy
    end
  end
end
