class RemoveDeviceFieldsToUser < ActiveRecord::Migration
  def change
    remove_column :users, :devise_model, :string
    remove_column :users, :devise_color, :string
  end
end
