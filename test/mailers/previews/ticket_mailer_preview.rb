# Preview all emails at http://localhost:3000/rails/mailers/ticket_mailer
class TicketMailerPreview < ActionMailer::Preview

  @ticket = Ticket.all.sample

  def new_ticket_email
    TicketMailer.with(ticket: @ticket).new_ticket_email
  end

end
