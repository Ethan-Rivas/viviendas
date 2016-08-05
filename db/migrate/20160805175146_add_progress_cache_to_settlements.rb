class AddProgressCacheToSettlements < ActiveRecord::Migration
  def change
    add_column :settlements, :progress, :integer
  end
end
