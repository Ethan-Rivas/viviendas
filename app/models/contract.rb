class Contract < ActiveRecord::Base
  has_many :settlements, through: :package
  belongs_to :package
  after_create :create_package
  after_create :generate_device
  has_many :users
  belongs_to :company

  validates :name, presence: true

  def progress
    return 0 if settlements.empty?
    settlements.all.map(&:progress).sum.to_f / settlements.count
  end

private

  def generate_device
    users.create({
      email: "#{name.split('-')[-2..-1].join('-')}@codigo.jade",
      code: rand(36**6).to_s(36).upcase
    })
  end

  def create_package
    update_attribute :package, Package.create(name: name)
  end
end
