require "rails_helper"

RSpec.describe Relationship do
  describe "belongs_to" do
    it { should belong_to :follower }
    it { should belong_to :followed }
  end

  describe "validations" do
    it { should validate_presence_of :follower_id }
    it { should validate_presence_of :followed_id }
  end
end
