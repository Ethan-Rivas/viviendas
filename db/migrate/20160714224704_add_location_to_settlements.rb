class AddLocationToSettlements < ActiveRecord::Migration
  def change
    add_column :settlements, :location_id, :integer
  end
end
