class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to coloni #{@user.username}"
      redirect_to colonies_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
