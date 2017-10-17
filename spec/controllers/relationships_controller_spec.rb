require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  # QUESTION: this skip validate is no good, implement some sort of Faker
  let!(:user) { create(:user) }
  let!(:followed_user) { create(:user)}
  let!(:relationship) { create(:relationship, { follower: user} ) }

  describe "POST #create" do
    it "redirects_back" do
      allow(controller).to receive(:current_user) { user }
      post :create, params: {followed_id: followed_user.id}
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE #destroy" do
    it "deletes session refreshes page" do
      allow(controller).to receive(:current_user) { user }
      delete :destroy, params: {followed_id: relationship.followed_id, id: user.id}
      expect(response).to have_http_status(302)
    end
  end

  describe "POST #show" do
    it "return http success" do
      allow(controller).to receive(:current_user) { user }
      post :show, params: {id: user.id}
      expect(response).to have_http_status(200)
    end
  end
end
