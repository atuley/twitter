require 'rails_helper'

feature 'Create tweet' do
  let!(:valid_tweet) { build(:tweet) }

  scenario 'with valid information' do
    tweet_page.visit_create_tweet
    tweet_page.fill_in_tweet(valid_tweet)
    tweet_page.submit

    # assert curent path is home
    # assert tweet was added to show liste
    # controller tests!
  end
end
