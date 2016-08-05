class ProgressInput < ActiveRecord::Base
  belongs_to :settlement
  belongs_to :progress_check

  validate :only_forward

  after_create :update_settlement_progress

private

  def update_settlement_progress
    settlement.update_progress!
  end

  def only_forward
    if self.progress < self.progress_was
      errors.add(:progress, 'No puede reducirse el progreso.')
    end
  end
end
