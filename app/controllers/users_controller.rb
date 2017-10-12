class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # TODO: understand strong parameters and their use
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thanks'
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
