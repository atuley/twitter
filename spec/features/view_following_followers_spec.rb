require 'rails_helper'

feature 'view followers and following' do
  let!(:tweet) { create(:tweet) }
  let!(:user) { create(:user, {email: 'foo2@bar.com'}) }

  before(:each) do
    user_log_in_page.sign_in(user)

    follow_a_user_page.visit_a_user_profile(tweet.user)
    follow_a_user_page.follow
  end

  scenario 'view followers' do
    view_following_followers_page.view_followers

    # TODO: this 1 should be an ID look at actual code again
    expect(current_path).to eq("/relationships/1")
    expect(view_following_followers_page).to have_text(user.email)
  end
end
