class TicketMailer < ApplicationMailer
  def new_ticket_email
    @ticket = params[:ticket]

    mail(to: @ticket.timeslot.user.email, subject: "You have a new Ticket!")
  end
end
