class KmlFile < ActiveRecord::Base
  has_attached_file :upload
  validates_attachment :upload, content_type: { content_type: 'application/octet-stream' }
  validates_format_of :upload_file_name, with: /\.kml\z/
end
