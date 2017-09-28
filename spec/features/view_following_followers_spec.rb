require 'rails_helper'

feature 'view followers and following' do
  let!(:valid_tweet) { build (:tweet) }
  let!(:user1) { build(:user) }
  let!(:user2) { build(:user, {email: 'foo2@bar.com'}) }

  before(:each) do
    # create user 1 account
    user_sign_up_page.visit("/users/new")
    user_sign_up_page.fill_in_account_information(user1)
    user_sign_up_page.submit

    # tweet with user 1
    tweet_page.visit_create_tweet
    tweet_page.fill_in_tweet(valid_tweet)
    tweet_page.submit

    # logout of user 1
    user_sign_up_page.logout

    # create user 2 and sign in
    user_sign_up_page.visit("/users/new")
    user_sign_up_page.fill_in_account_information(user2)
    user_sign_up_page.submit

    # follow user
    follow_a_user_page.visit_a_user_profile(user1)
    follow_a_user_page.follow
  end

  scenario 'view followers' do
    view_following_followers_page.view_followers

    expect(current_path).to eq("/relationships/1")
    expect(view_following_followers_page).to have_text(user2.email)
  end
end
