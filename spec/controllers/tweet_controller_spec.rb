require 'rails_helper'

RSpec.describe TweetController, type: :controller do
  let!(:valid_tweet) { build(:tweet) }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # How to test my controller properly RAILS 5 ISSUE
  # describe "POST #create" do
  #   it "with valid tweet info" do
  #     post :create, tweet: valid_tweet.content
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # test index
end
