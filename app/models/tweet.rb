class Tweet < ApplicationRecord
  validates :content, length: {maximum: 144}
  validates :content, presence: true
end
