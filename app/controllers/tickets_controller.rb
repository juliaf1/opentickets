class TicketsController < ApplicationController

  before_action :find_teacher, only: [ :create ]
  before_action :find_timeslot, only: [ :new, :create, :destroy ]

  def index
    # @tickets = Ticket.all
    # @tickets.where(user_id: current_user.id) || @tickets.where(timeslot_id: )
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @ticket.timeslot = @timeslot
    if @ticket.save
      redirect_to user_tickets_path(current_user)
    else
      redirect_to user_path(@teacher)
    end
  end

  def destroy
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description)
  end

  def find_timeslot
    @timeslot = Timeslot.find(params[:timeslot_id])
  end

  def find_teacher
    find_timeslot
    @teacher = @timeslot.user
  end
end
