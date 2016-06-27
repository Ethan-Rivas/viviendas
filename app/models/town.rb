class Town < ActiveRecord::Base
  has_many :settlements
end
