class Town < ActiveRecord::Base
  has_many :settlements

  validates :name, presence: true
end
