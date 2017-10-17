require 'rails_helper'

feature 'Log into account' do
  let!(:user) { create(:user) }
  let!(:tweet) { create(:tweet) }

  before(:each) do
    user_log_in_page.sign_in(user)
  end

  scenario 'and view own profile' do
    user_show_page.visit("/")
    user_show_page.go_to_own_profile

    expect(current_path).to eq("/users/#{user.id}")
    expect(user_show_page).to have_text(user.email)
  end

  scenario 'and view another user profile' do
    user_show_page.visit("/")
    user_show_page.go_to_user_profile(tweet.user)

    expect(current_path).to eq("/users/#{tweet.user.id}")
    expect(user_show_page).to have_text(tweet.user.email)
    expect(user_show_page).to have_text(tweet.content)
  end
end
