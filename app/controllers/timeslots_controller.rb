class TimeslotsController < ApplicationController

  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.user = current_user
    if @timeslot.save
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    @timeslot = Timeslot.find(params[:id])
    @timeslot.destroy
    redirect_to current_user
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:start_time)
  end

end
