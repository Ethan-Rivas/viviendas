class AddCuisToSettlements < ActiveRecord::Migration
  def change
    add_column :settlements, :cuis, :string
  end
end
