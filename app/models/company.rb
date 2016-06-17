class Company < ActiveRecord::Base
  has_many :contracts
  has_many :settlements, through: :contracts

  def self.avg_progress
    return 0 unless any?
    all.map(&:progress).sum.to_f / count
  end

  def progress
    return 0 if settlements.empty?
    settlements.all.map(&:progress).sum / settlements.count
  end
end
