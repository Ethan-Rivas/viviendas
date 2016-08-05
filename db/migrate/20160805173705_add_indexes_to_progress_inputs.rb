class AddIndexesToProgressInputs < ActiveRecord::Migration
  def change
    add_index :progress_inputs, :progress_check_id
    add_index :progress_inputs, :settlement_id
  end
end
