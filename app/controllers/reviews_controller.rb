class ReviewsController < ApplicationController
  before_action :find_ticket, only: [:new, :create]
  def new
    @review = Review.new
    skip_authorization
  end

  def create
    skip_authorization
    @review = Review.new(review_params)
    @review.ticket = @ticket
    if @review.save
      redirect_to user_tickets_path(current_user)
    else
      render :new
    end
  end

  private

  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
