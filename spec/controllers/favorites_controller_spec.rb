require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:tweet) { create(:tweet) }
  let!(:favorite) { create(:favorite) }

  describe "POST #create" do
    it "redirects_back" do
      allow(controller).to receive(:current_user) { user }
      post :create, params: {tweet_id: tweet.id, user: user}
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE #destroy" do
    it "deletes session refreshes page" do
      allow(controller).to receive(:current_user) { user }
      delete :destroy, params: {id: tweet.id}
      expect(response).to have_http_status(302)
    end
  end
end
