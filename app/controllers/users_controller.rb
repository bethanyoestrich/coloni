class UsersController < ApplicationController

before_action :set_user, only:[:edit, :update, :show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      flash[:success] = "Welcome to coloni #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def edit
  end


  def show
    @user=User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
