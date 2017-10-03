require 'support/pages/00_page'

class TweetPage < Page
  def visit_create_tweet
    visit "/tweet/new"
  end

  # TODO: left off here
  def fill_in_tweet(tweet)
    fill_in 'qa-tweet-content', with: tweet.content
  end

  def submit
    click_button 'qa-submit'
  end
end
