class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  belongs_to :contract

  include DeviseTokenAuth::Concerns::User
end
