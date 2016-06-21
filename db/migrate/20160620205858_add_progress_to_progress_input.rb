class AddProgressToProgressInput < ActiveRecord::Migration
  def change
    add_column :progress_inputs, :progress, :integer, default: 0
  end
end
