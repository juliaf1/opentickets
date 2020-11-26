class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index  
    @users = User.all
    authorize @users
    parse_date_range
    filtered_timeslots = Timeslot.where('start_time BETWEEN ? AND ?', @dates.first, @dates.last )
    available_filtered_timeslots = filtered_timeslots.reject do |timeslot|
      timeslot.ticket
    end
    @filtered_teachers = available_filtered_timeslots.map do |timeslot|
      timeslot.user
    end.uniq

    

    if params[:user] && params[:user][:skill_ids]
      @skills = params[:user][:skill_ids].map do |skill_id|
        Skill.find(skill_id)
      end
    end
    
    if @skills
      @filtered_by_skills = @users.select do |teacher|
        teacher.user_skills.any? do |user_skill|
          @skills.include?("#{user_skill.skill.name}")
        end
      end
    end
    
    # @fil_by_skill = @filtered_teachers.select! do |teacher|
      # teacher.user_skills.any? do |user_skill|
       # @skills.include?(user_skill.skill.name)
      # end
    # end
    
    # @filtered_teachers.select! do |teacher|
      #teacher.user_skills.any? do |user_skill|
      #  user_skill.skill == @search_skill
      #end
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

  def parse_date_range
    @dates = params[:beginning].to_s.split('to')
    @dates.map { |date| DateTime.parse(date) }
  end
end
