class TweetController < ApplicationController
  before_action :authenticate, only: [:new, :create]

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
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to '/'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id)
  end
end
