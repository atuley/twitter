class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # TODO: understand strong parameters and their use
    # TODO: refactor this

    if !User.exists?(email: user_params[:email])
      @user = User.new(user_params)
    else
      flash[:error] = "User already exists"
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render :new, status: 422
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
