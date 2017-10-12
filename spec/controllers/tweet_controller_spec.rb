require 'rails_helper'

RSpec.describe TweetController, type: :controller do
  let!(:user) { create(:user, :skip_validate) }
  let!(:valid_tweet) { create(:tweet) }
  let!(:invalid_tweet) { build(:tweet, content: "") }

  # QUESTION: selenium-server to drive tests

  describe "GET #new" do
    it "while logged in returns http success" do
      allow(controller).to receive(:current_user) { user }
      get :new
      expect(response).to have_http_status(200)
    end

    it "while not logged in redirects to login" do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe "POST #create" do
    it "with valid tweet info redirects to tweet index" do
      allow(controller).to receive(:current_user) { user }
      post :create, params: {tweet: {content: valid_tweet.content}}
      expect(response).to have_http_status(302)
    end

    it "with invalid tweet info gives 422" do
      allow(controller).to receive(:current_user) { user }
      post :create, params: {tweet: {content: invalid_tweet.content}}
      expect(response).to have_http_status(422)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE #destroy" do
    it "deletes tweet refreshes page" do
      allow(controller).to receive(:current_user) { user }
      delete :destroy, params: {id: valid_tweet.id}
      expect(response).to have_http_status(302)
    end
  end
end
