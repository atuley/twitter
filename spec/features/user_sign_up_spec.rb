require 'rails_helper'

feature 'Sign up for an account' do
  let!(:valid_user_infomation) { build(:user) }

  scenario 'with valid credentials' do
    user_sign_up_page.visit("/users/new")
    user_sign_up_page.fill_in_account_information(valid_user_infomation)
    user_sign_up_page.submit

    expect(current_path).to eq("/")
    expect(user_sign_up_page).to have_text(valid_user_infomation.email)
  end
end
