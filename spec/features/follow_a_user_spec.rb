require 'rails_helper'

feature 'Follow a user' do
  let!(:tweet) { create(:tweet) }
  let!(:user) { create(:user) }

  # TODO: README

  before(:each) do
    user_log_in_page.sign_in(user)
  end

  scenario 'with another user' do
    follow_a_user_page.visit_a_user_profile(tweet.user)
    follow_a_user_page.follow
    expect(follow_a_user_page).to have_text("#{tweet.user.followers.count}")
    expect(current_path).to eq("/users/#{tweet.user.id}")

    follow_a_user_page.unfollow
    expect(current_path).to eq("/users/#{tweet.user.id}")
    # QUESTION: check for class as well?
    expect(follow_a_user_page).to have_text("0")
  end
end
