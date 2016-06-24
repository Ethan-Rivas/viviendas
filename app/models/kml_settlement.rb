class KmlSettlement < ActiveRecord::Base
  has_many :kml_options
  belongs_to :kml_file
  belongs_to :settlement

  after_create :find_settlement
  after_update :update_settlement, if: :settlement_id_changed?

private

  def find_settlement
    (exact_match || fuzzy_match).tap do |settlement|
      update_attribute :settlement, settlement
    end
  end

  def exact_match
    Settlement.all.detect do |settlement|
      t(settlement.owner_full_name) == t(name)
    end
  end

  def fuzzy_match
    settlements = Settlement.all
    names = settlements.map { |s| t(s.owner_full_name) }

    match = FuzzyMatch.new(names).find(name)

    if match
      puts "#{match} - #{name}"
      settlements[names.index(match)]
    end
  end

  def update_settlement
    settlement.update_attributes({
      geo_x: geo_x,
      geo_y: geo_y
    })
  end

  def t(string)
    I18n.transliterate(string).upcase
  end
end
