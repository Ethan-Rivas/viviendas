class CreateProgressCheck < ActiveRecord::Migration
  def change
    create_table :progress_checks do |t|
      t.string :name
      t.integer :value
    end
  end
end
