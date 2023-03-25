class EventsController < ApplicationController
  def index
    render json: Event.all
  end

  def show
     event = Event.find(params[:id])
    if event
      render json: event, status: :ok
    else
      render json: {"error":"Event not found"}, status: :not_found
    end
  end

  def create
    event = Event.create(event_params)
    if event.valid?
      render json: {"success": "Event created successfully"}, status: :created
    else
      render json: {"error": "Event not created"}, status: :unprocessable_entity
    end
  end

  def update
    event = Event.find(params[:id])
    if event
      event.update(event_params)
      render json: {"success": "Event updated"}, status: :accepted
    else
      render json: {"error": "Unable to update event"}, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    head :no_content
    redirect_to events_path
  end

  # Private methods
  def event_params
    params.permit(:event_name, :event_date, :event_location, :event_description, :poster_url, :event_price, 
      :total_tickets, :start_time, :end_time, :contact, :age_restriction, :ticket_info, :lineup)
  end
end
