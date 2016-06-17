class AddSettlementToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :settlement_id, :integer
  end
end
