class AddFieldsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :name, :string
    add_column :companies, :rfc, :string
  end
end
