class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  delegate :settlements, to: :contract, allow_nil: true

  include DeviseTokenAuth::Concerns::User

  before_validation :generate_password

  def username
    email.split('@').first.upcase
  end

private

  def generate_password
    self.password = code
    self.password_confirmation = code
  end
end
