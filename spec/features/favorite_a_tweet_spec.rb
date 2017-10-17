require 'rails_helper'

feature 'Favorite a tweet' do
  let!(:tweet) { create(:tweet) }
  let!(:user) { create(:user) }

  before(:each) do
    user_log_in_page.sign_in(user)
  end

  scenario 'as another user' do
    visit "/"
    favorite_a_tweet_page.favorite(tweet)

    expect(current_path).to eq("/")
    # QUESTION: check for class too?
    expect(favorite_a_tweet_page).to have_text("#{tweet.favorites.count}")
  end
end
