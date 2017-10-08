class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_favorite(tweet_id)
    current_user.favorites.find_by(tweet_id: tweet_id)
  end

  def tweet_favored?(tweet_id)
	  !get_favorite(tweet_id).nil?
  end

  helper_method :tweet_favored?
  helper_method :get_favorite


  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  helper_method :current_user

  def authorize
    redirect_to login_path, alert: "Not authorized" if current_user.nil?
  end
end
