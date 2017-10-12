require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:valid_user_infomation) { create(:user, :skip_validate) }
  let!(:invalid_user_infomation) { build(:user, {email: "email.com"}) }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "with valid tweet info redirects to tweet index" do
      post :create, params: { email: valid_user_infomation.email, password: valid_user_infomation.password}
      expect(response).to have_http_status(302)
    end

    it "with invalid tweet info renders log in page again" do
      post :create, params: { email: invalid_user_infomation.email, password: invalid_user_infomation.password}
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE #destroy" do
    it "deletes session refreshes page" do
      delete :destroy
      expect(response).to have_http_status(302)
    end
  end
end
