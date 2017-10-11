class User < ApplicationRecord
  has_many :tweets, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :favorites

  has_secure_password

  validates :email, :password, :password_confirmation, presence: true
  # TODO: implement a "Your Feed" that only shows your tweets and the people you follow, and then a home page thing
  # TODO: fix email hash check
  # TODO: fix duplicate logins/account creation
  validates :email, format: { with: %r{.+@.+\..+} }
  # TODO: change password length
  validates :password, length: { within: 6..40 }

  def follow(another_user)
    active_relationships.create(followed_id: another_user.id)
  end

  def unfollow(another_user)
    active_relationships.find_by(followed_id: another_user.id).destroy
  end

  def following?(another_user)
    following.include?(another_user)
  end
end
