class FavoritesController < ApplicationController
  def create
    puts params.inspect
    @favorite = Favorite.create(tweet_id: params[:tweet_id], user: current_user)
    redirect_back(fallback_location: root_path)
  end
end
