class AddNewFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :code, :string
  end
end
