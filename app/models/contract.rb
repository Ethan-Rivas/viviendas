class Contract < ActiveRecord::Base
  has_many :settlements, through: :package
  belongs_to :package
  has_many :users
  belongs_to :company

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

  def generate_devices(first, last)
    (first..last).each do |i|
      users.create({
        email: "#{name}-M#{i}@codigo.jade",
        code: 'CODIGO'
      })
    end
  end

  def destroy_devices_from(n)
    users.each_with_index do |user, index|
      user.destroy if index >= n
    end
  end
end
