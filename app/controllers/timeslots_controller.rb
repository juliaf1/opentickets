class TimeslotsController < ApplicationController
  def new
    @timeslot = Timeslot.new
    authorize current_user
  end

  def create
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.user = current_user
    authorize @timeslot
    respond_to do |format|
      if @timeslot.save
        format.html { redirect_to current_user, notice: 'Timeslot was successfully created' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @timeslot = Timeslot.find(params[:id])
    authorize @timeslot

    @timeslot.destroy
    redirect_to user_path(current_user)
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:start_time)
  end
end
