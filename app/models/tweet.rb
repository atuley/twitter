class Tweet < ApplicationRecord
  belongs_to :user

  validates :content, length: {maximum: 144}
  validates :content, presence: true
end
