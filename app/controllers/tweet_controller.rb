class TweetController < ApplicationController
  before_action :authorize, only: [:new, :create]
  before_action :find_tweet, only: [:destroy]

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to "/"
    else
      render :new, status: 422
    end
  end

  def index
    @tweets = Tweet.all
  end

  def destroy
    @tweet.destroy
    redirect_to '/'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id)
  end

  def find_tweet
    @tweet = Tweet.find(params[:id])
  end
end
