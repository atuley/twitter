class RelationshipsController < ApplicationController
  before_action :authenticate, only: [:create, :destroy]

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @user = User.find(params[:followed_id])
    current_user.unfollow(@user)
    redirect_back(fallback_location: root_path)
  end

  def show
    @user = User.find(params[:id])
  end
end
