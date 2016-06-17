class AddPackageToSettlement < ActiveRecord::Migration
  def change
    add_column :settlements, :package_id, :integer
  end
end
