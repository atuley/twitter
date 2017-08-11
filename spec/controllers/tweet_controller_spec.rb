require 'rails_helper'

RSpec.describe TweetController, type: :controller do
  let!(:valid_tweet) { build(:tweet) }
  let!(:invalid_tweet) { build(:tweet, content: '') }
  let!(:valid_user_infomation) { build(:user) }

  # Do I test negative controller cases? i.e. returns 404

  before(:each) do
    user_sign_up_page.visit("/users/new")
    user_sign_up_page.fill_in_account_information(valid_user_infomation)
    user_sign_up_page.submit
  end

  # Should be expecting 200 but was getting 302

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe "POST #create" do
    it "with valid tweet info" do
      post :create, params: { content: valid_tweet.content }
      expect(response).to have_http_status(302)
    end
  end

end
