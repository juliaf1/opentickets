class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def edit
    @user = User.new
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :bio, :hourly_rate)
  end
end
