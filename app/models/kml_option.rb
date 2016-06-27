class KmlOption < ActiveRecord::Base
  belongs_to :kml_settlement
  belongs_to :settlement

  def self.for_select
    all.map do |option|
      [option.settlement.owner_name, option.settlement.id]
    end + [['No se encontraron opciones', nil]]
  end
end
