class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index  
    @users = User.all
    authorize @users
    
    parse_date_range
    filtered_timeslots = Timeslot.where('start_time BETWEEN ? AND ?', @dates.first, @dates.last)
    
    available_filtered_timeslots = filtered_timeslots.reject do |timeslot|
      timeslot.ticket
    end
    @filtered_teachers = available_filtered_timeslots.map do |timeslot|
      timeslot.user
    end.uniq
  end

  def show
    mark_map
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

  def mark_map
    find_user
    if @user.latitude && @user.longitude
      @mark = {
        lgn: @user.longitude,
        lat: @user.latitude
      }
    end
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :photo, :city)
  end

  def parse_date_range
    @dates = params[:beginning].to_s.split('to')
    @dates.map { |date| DateTime.parse(date) }
  end
end
