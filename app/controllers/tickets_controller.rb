class TicketsController < ApplicationController
      before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def create
    user_id = current_user.id
    event_id = params[:event_id] # assuming you pass the event_id as a parameter
    if Payment.where(user_id: user_id, event_id: event_id).exists?
      @ticket = Ticket.new(ticket_params)
      @ticket.user_id = user_id
      @ticket.event_id = event_id
      if @ticket.save
        redirect_to @ticket, notice: 'Ticket was successfully created.'
      else
        render :new
      end
    else
      redirect_to events_path, notice: 'Payment not found for the selected event.'
    end
  end

  private
  
    def ticket_params
      params.permit(:booking_date, :ticket_type, :paid)
    end
end
