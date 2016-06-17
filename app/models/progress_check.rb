class ProgressCheck < ActiveRecord::Base
  has_many :progress_inputs
  has_many :settlements, :through => :progress_inputs
end
