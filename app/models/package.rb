class Package < ActiveRecord::Base
  has_many :contracts
  has_many :settlements
end
