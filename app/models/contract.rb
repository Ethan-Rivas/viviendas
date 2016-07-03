class Contract < ActiveRecord::Base
  has_many :settlements, through: :package
  belongs_to :package
  after_create :create_package
  after_create :generate_device
  has_many :users
  belongs_to :company

  validates :name, presence: true

  def devices_number
    users.count
  end

  def devices_number=(n)
    n = n.to_i
    generate_devices(devices_number.succ, n) if n > devices_number
    destroy_devices_from(n) if n < devices_number
  end

  def progress
    return 0 if settlements.empty?
    settlements.all.map(&:progress).sum.to_f / settlements.count
  end

private

  def generate_device
    users.create({
      email: "#{name}@codigo.jade",
      code: rand(36**6).to_s(36).upcase
    })
  end

  def destroy_devices_from(n)
    users.each_with_index do |user, index|
      user.destroy if index >= n
    end
  end

  def create_package
    update_attribute :package, Package.create(name: name)
  end
end
