class CreateSettlements < ActiveRecord::Migration
  def change
    create_table :settlements do |t|
      t.string :uno
      t.string :dos
      t.string :tres
      t.string :contract_id
    end
  end
end
