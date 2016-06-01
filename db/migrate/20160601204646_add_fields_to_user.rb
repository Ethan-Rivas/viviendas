class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :contract_id, :string
    add_column :users, :devise_model, :string
    add_column :users, :devise_color, :string
  end
end
