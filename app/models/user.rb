class User < ApplicationRecord
  has_many :tweets

  has_secure_password

  validates :email, :password, :password_confirmation, presence: true
  validates :email, format: { with: %r{.+@.+\..+} }
  validates :password, length: { within: 6..40 }
end
