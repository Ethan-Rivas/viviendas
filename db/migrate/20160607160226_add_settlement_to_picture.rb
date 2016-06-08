class AddSettlementToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :settlement_id, :string
  end
end
