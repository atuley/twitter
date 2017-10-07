require 'support/pages/00_page'

class FavoriteATweetPage < Page
  def favorite(tweet)
    find(".qa-favorite-tweet-#{tweet.id}").click
  end
end
