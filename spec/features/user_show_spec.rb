require 'rails_helper'

feature 'Log into account' do
  let!(:valid_user_infomation) { build(:user) }
  let!(:valid_tweet) { build(:tweet) }

  # move this inside view on profile test
  before(:each) do
    user_sign_up_page.visit("/users/new")
    user_sign_up_page.fill_in_account_information(valid_user_infomation)
    user_sign_up_page.submit

    tweet_page.visit_create_tweet
    tweet_page.fill_in_tweet(valid_tweet)
    tweet_page.submit
  end

  scenario 'and view own profile' do
    user_show_page.visit("/")
    user_show_page.go_to_own_profile(valid_user_infomation)

    # eq("/users/#{valid_user_infomation.id}")
    expect(current_path).to eq("/users/1")
    expect(user_show_page).to have_text(valid_user_infomation.email)
    expect(user_show_page).to have_text(valid_tweet.content)
  end

  # need to create a post to have shown possibly

  # scenario 'and view a user profile' do
  #   user_show_page.visit("/")
  #   user_show_page.go_to_user_profile
  #
  #   expect(current_path).to eq()
  # end
end
