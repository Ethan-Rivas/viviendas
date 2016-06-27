class ChangeAccuracyToRankInKmlOptions < ActiveRecord::Migration
  def change
    remove_column :kml_options, :accuracy
    add_column :kml_options, :rank, :integer
  end
end
