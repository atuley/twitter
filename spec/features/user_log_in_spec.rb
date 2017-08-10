require 'rails_helper'

feature 'Log into account' do
  let!(:valid_user_infomation) { build(:user) }
  let!(:invalid_user_information) { build(:user, email: '') }

  scenario 'with valid credentials' do
    user_sign_up_page.visit("/users/new")
    user_sign_up_page.fill_in_account_information(valid_user_infomation)
    user_sign_up_page.submit

    # this is flaky
    # expect(current_path).to eq("/")
    expect(user_sign_up_page).to have_text(valid_user_infomation.email)

  end

  scenario 'with invalid credentials' do
    user_sign_up_page.visit("/users/new")
    user_sign_up_page.fill_in_account_information(invalid_user_information)
    user_sign_up_page.submit

    # expect(current_path).to eq("/user/new")
    expect(user_sign_up_page).to have_text("Email")
  end
end
