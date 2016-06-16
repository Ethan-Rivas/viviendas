class ProgressInput < ActiveRecord::Base
  belongs_to :settlement
  belongs_to :progress_check
end
