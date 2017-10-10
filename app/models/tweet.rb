class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites

  validates :content, length: {maximum: 144}
  validates :content, presence: true
end
