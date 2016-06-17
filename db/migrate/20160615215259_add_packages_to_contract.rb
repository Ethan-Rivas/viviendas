class AddPackagesToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :package_id, :integer
  end
end
