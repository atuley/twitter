require 'rails_helper'

feature 'Follow a user' do
  let!(:tweet) { create(:tweet) }
  let!(:user) { create(:user, {email: 'foo2@bar.com'}) }

  # TODO: add twitter handle instead of username

  before(:each) do
    user_log_in_page.sign_in(user)
  end

  scenario 'with another user' do
    # TODO: stop hard coding values like Followers: 1, use string interpolation
    # TODO: click on classes not labels

    follow_a_user_page.visit_a_user_profile(tweet.user)
    follow_a_user_page.follow

    expect(current_path).to eq("/users/1")
    expect(follow_a_user_page).to have_text("Followers: 1")
  end
end
