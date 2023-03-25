require 'twilio-ruby'

class PaymentsController < ApplicationController
    # before_action :set_payment, only: [:create]

   def create
    @payment = Payment.new(payment_params)
    # @payment.user_id = current_user.id
    @payment.reference_number = SecureRandom.hex(6) # generate a random string of 6 characters
    @payment.save

    # send SMS message with OTP to user's phone number
    account_sid = ENV['AC515bfd95bf56ca19e302dee232948f7f']
    auth_token = ENV['4bf2a18030721bc378f5b76abca6c58b']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    message = client.messages.create(
      body: "Your OTP is #{@payment.reference_number}",
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: "+254111704482"
    )

    render json: { reference_number: @payment.reference_number }
  end

  # # Confirm payment
  #   def show
  #   payment = Payment.find(params[:id])
  #   if params[:reference_number] == payment.reference_number
  #     ticket = Ticket.new(ticket_params)
  #     ticket.user_id = current_user.id
  #     ticket.event_id = payment.event_id
  #     ticket.paid = true
  #     if ticket.save
  #       redirect_to @ticket, notice: 'Ticket was successfully created.'
  #     else
  #       flash.now[:alert] = 'Payment confirmed successfully.'
  #       render json: {"success": "Payment confirmed"}, status: :accepted
  #     end
  #   else
  #     flash.now[:alert] = 'Invalid reference number. Please try again.'
  #   end
  # end

  private
    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.permit(:amount, :date, :payment_method, :event_id, :user_id)
    end
     def ticket_params
      params.permit(:booking_date, :ticket_type)
    end
end
