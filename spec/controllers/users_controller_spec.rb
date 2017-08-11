require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:valid_user_infomation) { build(:user) }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  # 302 thing again ;(

  describe "POST #create" do
    it "returns http success" do
      post :create, params: { user: { email: valid_user_infomation.email, password: valid_user_infomation.password, password_confirmation:valid_user_infomation.password_confirmation} }
      expect(response).to have_http_status(302)
    end
  end
end
