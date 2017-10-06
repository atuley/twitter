require "rails_helper"

RSpec.describe User do
  # QUESTION: should I be adding values to actually test some of this

  describe "has_many" do
    it { should have_many :tweets }
    it { should have_many :active_relationships }
    it { should have_many :passive_relationships }
    it { should have_many :following }
    it { should have_many :followers }
  end

  describe "has_secure_password" do
    it { should have_secure_password }
  end

  describe "field validation" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
  end

  describe "email format" do
    it { should allow_value("foo@bar.com").for(:email) }
    it { should_not allow_value("foo.com").for(:email) }
  end

  describe "password length" do
    it { should allow_value("password").for(:password) }
    it { should_not allow_value("123").for(:password) }
  end

  describe "follow" do
    let!(:user) { create(:user) }
    let!(:other) { create(:user) }

    xit "follows user" do
      active_relationships.create(followed_id: other.id)
    end
  end

  describe "unfollow" do
    let!(:user) { create(:user) }
    let!(:other) { create(:user) }

    xit "unfollows user" do
      active_relationships.find_by(followed_id: other.id)
    end
  end

  describe "following?" do
    let!(:user) { create(:user) }
    let!(:other) { create(:user) }

    # TODO: active_relationships factory
    xit "unfollows user" do
      expect(user.following?(other)).to eq(true)
    end
  end
end
