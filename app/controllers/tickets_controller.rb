class TicketsController < ApplicationController
  before_action :find_teacher, only: [:create]
  before_action :find_timeslot, only: [:new, :create]

  def index
    @student_tickets = Ticket.where(user_id: params[:user_id])
    @teacher_tickets = Ticket.joins(:timeslot).where(timeslots: { user_id: params[:user_id] })
  end

  def new
    @ticket = Ticket.new
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @ticket.timeslot = @timeslot
    authorize @ticket
    respond_to do |format|
      if @ticket.save
        TicketMailer.with(ticket: @ticket).new_ticket_email.deliver_later
        format.html { redirect_to user_tickets_path(current_user), notice: 'Your ticket was created successfully' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { redirect_to user_path(@timeslot.user_id) }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    if @ticket.timeslot.start_time - Time.now > 86_400
      @ticket.destroy
      redirect_to user_tickets_path(current_user), notice: 'Your ticket was canceled 😞'
    else
      redirect_to user_tickets_path(current_user), alert: "You can't cancel a Ticket with less than 24h notice!"
    end
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
