class Contract < ActiveRecord::Base
  has_many :settlements
  belongs_to :package
  has_many :users
  belongs_to :company

  attr_accessor :devices_number
end
