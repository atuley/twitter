require 'rails_helper'

feature 'Log into account' do
  let!(:valid_user_infomation) { create(:user) }

  scenario 'with valid credentials' do
    user_log_in_page.visit("/login")
    user_log_in_page.fill_in_account_information(valid_user_infomation)
    user_log_in_page.submit

    expect(current_path).to eq("/")
    expect(user_log_in_page).to have_text(valid_user_infomation.email)
  end
end
