require 'rails_helper'

feature 'Sign up for an account' do
  # let!(:valid_user_infomation) { build(:user) }
  # let!(:invalid_user_information) { build(:user, email: '') }

  scenario 'with valid credentials' do
    user_sign_up_page.visit("/user/new")
    user_sign_up_page.fill_in_account_information(valid_user_infomation)
    user_sign_up_page.submit

    expect(user_sign_up_page).to have_text(valid_user_infomation.email)
    expect(current_path).to eq("/")
  end

  scenario 'with invalid credentials' do
    user_sign_up_page.visit("/user/new")
    user_sign_up_page.fill_in_account_information(invalid_user_infomation)
    user_sign_up_page.submit

    expect(current_path).to eq("/user/new")
  end
end
