class User < ApplicationRecord
  has_many :tweets, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_secure_password

  validates :email, :password, :password_confirmation, presence: true
  # TODO: implement a "Your Feed" that only shows your tweets and the people you follow, and then a home page thing
  # TODO: fix email hash check
  # TODO: fix duplicate logins/account creation
  validates :email, format: { with: %r{.+@.+\..+} }
  validates :password, length: { within: 6..40 }

  def follow(other)
    active_relationships.create(followed_id: other.id)
  end

  def unfollow(other)
    active_relationships.find_by(followed_id: other.id).destroy
  end

  def following?(other)
    following.include?(other)
  end
end
