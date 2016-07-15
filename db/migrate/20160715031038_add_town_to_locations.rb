class AddTownToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :town_id, :integer
  end
end
