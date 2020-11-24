class UsersController < ApplicationController

  before_action :find_user, only: [ :show, :edit, :update ]
  before_action :user_params, only: [ :update ]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user = @user.update(user_params)
    @user.save
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:hourly_rate)
  end
end
