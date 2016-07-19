class Location < ActiveRecord::Base
  has_many :settlements
  belongs_to :town

  has_many :location_contracts
  has_many :contracts, through: :location_contracts

  validates :name, presence: true
end
