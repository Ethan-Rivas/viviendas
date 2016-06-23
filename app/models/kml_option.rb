class KmlOption < ActiveRecord::Base
  belongs_to :kml_settlement
  belongs_to :settlement
end
