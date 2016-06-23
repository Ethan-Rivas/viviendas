class KmlSettlement < ActiveRecord::Base
  has_many :kml_options
  belongs_to :kml_file
end
