class AddDefaultToProgress < ActiveRecord::Migration
  def change
    change_column :settlements, :progress, :integer, default: 0
  end
end
