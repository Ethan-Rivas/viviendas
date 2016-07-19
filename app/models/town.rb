class Town < ActiveRecord::Base
  has_many :settlements
  has_many :locations

  validates :name, presence: true
end
