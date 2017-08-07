require 'support/pages/00_page'

class TweetPage < Page
  def visit_create_tweet
    visit "/tweet/new"
  end

  def fill_in_tweet(tweet)
    fill_in 'What is on your mind?', with: tweet.content
  end

  def submit
    click_button 'Submit'
  end
end
