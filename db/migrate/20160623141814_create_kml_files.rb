class CreateKmlFiles < ActiveRecord::Migration
  def change
    create_table :kml_files do |t|
      t.string   "upload_file_name"
      t.string   "upload_content_type"
      t.integer  "upload_file_size"
      t.datetime "upload_updated_at"
    end
  end
end
