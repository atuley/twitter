require "rails_helper"

RSpec.describe User do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }

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
    it "creates active_relationship" do
      user.follow(another_user)
      relationship = user.active_relationships.first

      expect(user.active_relationships.count).to eq(1)
      expect(relationship.follower_id).to eq(user.id)
      expect(relationship.followed_id).to eq(another_user.id)
    end
  end

  describe "unfollow" do
    it "deletes active_relationship" do
      create(:relationship, { follower: user, followed: another_user })
      user.unfollow(another_user)

      expect(user.active_relationships.count).to eq(0)
    end
  end

  describe "following?" do
    it "returns true if user is following another user" do
      create(:relationship, { follower: user, followed: another_user })
      expect(user.following?(another_user)).to eq(true)
    end

    it "returns false if user is not following another user" do
      expect(user.following?(another_user)).to eq(false)
    end
  end
end
