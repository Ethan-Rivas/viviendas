class Contract < ActiveRecord::Base
  has_many :settlements
  has_many :packages
  has_many :users
  belongs_to :company
end
