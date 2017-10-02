require 'rails_helper'

feature 'Log into account' do
  let!(:valid_user_infomation) { build(:user) }

  before(:each) do
    user_sign_up_page.visit("/users/new")
    user_sign_up_page.fill_in_account_information(valid_user_infomation)
    user_sign_up_page.submit
  end

  scenario 'with valid credentials' do
    user_log_in_page.visit("/login")
    user_log_in_page.fill_in_account_information(valid_user_infomation)
    user_log_in_page.submit

    expect(current_path).to eq("/")
    expect(user_log_in_page).to have_text(valid_user_infomation.email)
  end
end
