class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    authorize @users
    dates = params[:beginning].to_s.split('to')
    dates.map { |date| DateTime.parse(date) }
    filtered_timeslots = Timeslot.where('start_time BETWEEN ? AND ?', dates.first, dates.last )
    available_filtered_timeslots = filtered_timeslots.reject do |timeslot|
      timeslot.ticket
    end
    @filtered_teachers = available_filtered_timeslots.map do |timeslot|
      timeslot.user
    end.uniq

 

    # @search_skill = Skill.find_by(name: params[:skill])
    
    # @filtered_teachers.select! do |teacher|
      #teacher.user_skills.any? do |user_skill|
      #  user_skill.skill == @search_skill
      #end
    # end
    
    # @skill1 = User.find(6).user_skills.any? do |user_skill|
      # user_skill.skill == Skill.find(7)
    # end
  end

  def show
    @user_skills = @user.user_skills.includes(:skill)
    @reviews = @user.reviews
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to @user, notice: 'Your update was successfull!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :photo, :hourly_rate)
  end
end
