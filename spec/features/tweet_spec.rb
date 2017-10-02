require 'rails_helper'

feature 'Create tweet' do
  let!(:valid_tweet) { build(:tweet) }
  let!(:user) { create(:user) }

  before(:each) do
    user_log_in_page.sign_in(user)
  end

  scenario 'with valid information' do
    tweet_page.visit_create_tweet
    tweet_page.fill_in_tweet(valid_tweet)
    tweet_page.submit

    expect(tweet_page).to have_text(valid_tweet.content)
    expect(current_path).to eq("/")
  end
end
