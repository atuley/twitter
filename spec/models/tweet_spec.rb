require "rails_helper"

RSpec.describe Tweet do
  describe "belongs_to" do
    it { should belong_to :user }
  end

  describe "content length" do
    it { should allow_value("this is a tweet").for(:content) }
    it { should_not allow_value("").for(:content) }
    it { should_not allow_value("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee").for(:content) }
  end

  describe "content validation" do
    it { should validate_presence_of :content }
  end
end
