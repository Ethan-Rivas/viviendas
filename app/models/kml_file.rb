class KmlFile < ActiveRecord::Base
  has_attached_file :upload
  validates_attachment :upload, content_type: {
    content_type: [
      'application/octet-stream',
      'application/vnd.google-earth.kml+xml'
    ]
  }
  #validates_format_of :upload_file_name, with: /\.kml\z/

  belongs_to :town
  validates :town, presence: true
  has_many :town_settlements, through: :town, source: :settlements

  has_many :kml_settlements, dependent: :destroy
  after_commit :extract_settlements, on: :create
  accepts_nested_attributes_for :kml_settlements

  def orphan_settlements
    town_settlements.where.not(id: kml_settlements.pluck(:settlement_id))
  end

  def orphan_locations
    kml_settlements.where(settlement_id: nil)
  end

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
