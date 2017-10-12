require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:valid_user_infomation) { create(:user) }
  let!(:invalid_user_infomation) { build(:user, { email: "email.com" }) }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: valid_user_infomation.id}
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, params: { user: { email: "testerlester@ex.com", password: valid_user_infomation.password, password_confirmation:valid_user_infomation.password_confirmation} }
      expect(response).to have_http_status(302)
    end

    it "returns http failure when invalid information" do
      post :create, params: { user: { email: invalid_user_infomation.email, password: invalid_user_infomation.password, password_confirmation: invalid_user_infomation.password_confirmation} }
      expect(response).to have_http_status(422)
    end
  end
end
