class Favorite < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  validates :tweet_id, presence: true
  validates :user_id, presence: true
end
