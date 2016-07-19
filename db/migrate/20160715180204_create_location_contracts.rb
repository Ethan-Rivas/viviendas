class CreateLocationContracts < ActiveRecord::Migration
  def change
    create_table :location_contracts do |t|
      t.integer :location_id
      t.integer :contract_id
    end
  end
end
