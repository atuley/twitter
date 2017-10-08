require "rails_helper"

RSpec.describe Favorite do
  describe "belongs_to" do
    it { should belong_to :tweet }
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :tweet_id }
    it { should validate_presence_of :user_id }
  end
end
