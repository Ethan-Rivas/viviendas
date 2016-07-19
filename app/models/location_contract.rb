class LocationContract < ActiveRecord::Base
  belongs_to :contract
  delegate :company, to: :contract, allow_nil: true

  belongs_to :location
  delegate :town, to: :location, allow_nil: true

  def settlements
    return Settlement.none unless location.present? && contract.present?

    contract.settlements.where(location_id: location.id)
  end

  def progress
    settlements.progress
  end
end
