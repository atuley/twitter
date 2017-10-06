require 'rails_helper'

feature 'Follow a user' do
  let!(:valid_tweet) { build (:tweet) }
  let!(:user1) { build(:user) }
  let!(:user2) { build(:user, {email: 'foo2@bar.com'}) }

  # TODO: add twitter handle instead of username

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
  end

  scenario 'with another user' do
    # go to user 1's profile
    follow_a_user_page.visit_a_user_profile(user1)
    follow_a_user_page.follow

    expect(current_path).to eq("/users/1")
    expect(follow_a_user_page).to have_text("Followers: 1")
  end
end
