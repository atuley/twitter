class TweetController < ApplicationController

  before_action :authorize, only: [:new, :create]

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to "/"
    else
      render "new"
    end
  end

  def index
    @tweets = Tweet.all
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id)
  end

  def find_post
    @tweet = Tweet.find(params[:id])
  end
end
