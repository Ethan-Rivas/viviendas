class CreateProgressInput < ActiveRecord::Migration
  def change
    create_table :progress_inputs do |t|
      t.string :progress_check_id
      t.string :settlement_id
      
      t.timestamps null: false
    end
  end
end
