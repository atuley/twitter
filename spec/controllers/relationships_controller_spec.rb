require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:followed_user) {create(:user, {email: "foo2@bar.com"})}

  describe "POST #create" do
    it "redirects_back" do
      allow(controller).to receive(:current_user) { user }
      post :create, params: {followed_id: followed_user.id}
      expect(response).to have_http_status(302)
    end
  end

  # TODO: left off here
  describe "DELETE #destroy" do
    xit "deletes session refreshes page" do
      allow(controller).to receive(:current_user) { user }
      delete :destroy, params: {followed_id: followed_user.id, id: user.id}
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
