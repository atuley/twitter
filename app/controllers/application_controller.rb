class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authenticate
    redirect_to login_path, alert: "Not authenticated" if current_user.nil?
  end

  def get_favorite(tweet_id)
    current_user.favorites.find_by(tweet_id: tweet_id)
  end

  def tweet_favored?(tweet_id)
	  !get_favorite(tweet_id).nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  helper_method :current_user
  helper_method :tweet_favored?
  helper_method :get_favorite
end
