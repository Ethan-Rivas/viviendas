class AddCompanyToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :company_id, :string
  end
end
