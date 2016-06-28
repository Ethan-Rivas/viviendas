class ProgressCheck < ActiveRecord::Base
  has_many :progress_inputs, dependent: :destroy
  has_many :settlements, :through => :progress_inputs
end
