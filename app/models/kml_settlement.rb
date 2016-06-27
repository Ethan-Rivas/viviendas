class KmlSettlement < ActiveRecord::Base
  has_many :options, class_name: 'KmlOption', dependent: :destroy
  belongs_to :kml_file
  belongs_to :settlement

  after_create :generate_options
  after_update :update_settlement, if: Proc.new { |kml|
    kml.settlement_id_changed? && kml.settlement.present?
  }

private

  def generate_options
    kml_file.town.settlements.find_by_fuzzy_owner_name(t(name)).each_with_index do |settlement, index|
      options.create(settlement: settlement, rank: index.succ)
    end
  end

  def update_settlement
    settlement.update_attributes({
      geo_x: geo_x,
      geo_y: geo_y
    })
  end

  def t(string)
    string && I18n.transliterate(string).upcase
  end
end
