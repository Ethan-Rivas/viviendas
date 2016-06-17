class CreateProgressInput < ActiveRecord::Migration
  def change
    create_table :progress_inputs do |t|
      t.integer :progress_check_id
      t.integer :settlement_id

      t.timestamps null: false
    end
  end
end
