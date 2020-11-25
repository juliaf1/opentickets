class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    # @filtered_teachers = User.where(first_name: params[:search])
    # @filtered_teachers = User.joins(:timeslot).where('start_time > ?', DateTime.now)
    # Timeslot.where('start_time > ?', params[:search])
    filtered_timeslots = Timeslot.where('start_time BETWEEN ? AND ?', params[:beginning], params[:end])
    # filtered_timeslots = Timeslot.where('start_time > ?', params[:beginning])
    available_filtered_timeslots = filtered_timeslots.reject do |timeslot|
      timeslot.ticket
    end
    @filtered_teachers = available_filtered_timeslots.map do |timeslot|
      timeslot.user
    end.uniq
  end

  def show
    @user_skills = @user.user_skills.includes(:skill)
    @reviews = @user.reviews
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
<<<<<<< HEAD
    params.require(:user).permit(:first_name, :last_name, :email, :bio, :hourly_rate, :beginning, :end)
=======
    params.require(:user).permit(:first_name, :last_name, :email, :bio, :photo, :hourly_rate)
>>>>>>> master
  end
end
