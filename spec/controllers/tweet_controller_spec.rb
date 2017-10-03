require 'rails_helper'

RSpec.describe TweetController, type: :controller do
  let!(:user) { create(:user) }
  let!(:valid_tweet) { create(:tweet) }
  let!(:invalid_tweet) { build(:tweet, content: "") }

  # TODO: SEED FILE

  before(:each) do
    allow(controller).to receive(:current_user) { user }
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "with valid tweet info" do
      post :create, params: {tweet: {content: valid_tweet.content}}
      expect(response).to have_http_status(302)
    end

    it "with invalid tweet info" do
      post :create, params: {tweet: {content: invalid_tweet.content}}
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE #destroy" do
    it "deletes tweet" do  
      delete :destroy, params: {tweet: valid_tweet}
      expect(response).to have_http_status(200)
    end
  end
end
