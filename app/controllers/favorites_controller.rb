class FavoritesController < ApplicationController
  before_action :authorize, only: :create

  def create
    @favorite = Favorite.create(tweet_id: params[:tweet_id], user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
