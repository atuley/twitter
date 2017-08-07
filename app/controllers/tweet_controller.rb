class TweetController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to "/"
    else
      render "new"
    end
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def show
    Tweet.all
  end
end
