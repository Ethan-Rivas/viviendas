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
    fuzzy_options.each_with_index do |settlement, index|
      options.create(settlement: settlement, rank: index.succ)
    end
  end

  def fuzzy_options(limit = 10)
    kml_file.town.settlements.find_by_fuzzy_owner_name(t(name), limit: limit)
  rescue
    fuzzy_options(limit / 2)
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
