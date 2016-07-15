class Location < ActiveRecord::Base
  has_many :settlements
  belongs_to :town

  validates :name, presence: true
end
