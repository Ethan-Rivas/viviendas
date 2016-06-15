class Package < ActiveRecord::Base
  belongs_to :contract
  has_many :settlements
end
