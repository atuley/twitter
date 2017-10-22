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

  def tweet_favored?(tweet_id)
	  !get_favorite(tweet_id).nil?
  end

  def get_favorite(tweet_id)
    current_user.favorites.find_by(tweet_id: tweet_id)
  end

  helper_method :tweet_favored?
  helper_method :get_favorite
end
