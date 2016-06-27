class KmlFile < ActiveRecord::Base
  has_attached_file :upload
  validates_attachment :upload, content_type: { content_type: 'application/octet-stream' }
  validates_format_of :upload_file_name, with: /\.kml\z/

  belongs_to :town
  validates :town, presence: true

  has_many :kml_settlements, dependent: :destroy
  after_commit :extract_settlements, on: :create
  accepts_nested_attributes_for :kml_settlements

  def extract_settlements
    KmlParser.new(xml).parse.each do |settlement|
      kml_settlements.create(settlement)
    end
  end

  def xml
    path = "#{Rails.root}/tmp/#{id}.kml"
    upload.copy_to_local_file(:original, path)

    File.open(path, 'r').read
  end
end
