class AttendancesController < ApplicationController

  before_action :authenticate_user!


  def new
    @event = Event.find(params[:event_id])
    @amount = @event.price
  end

  def index
    @event = Event.find(params[:event_id])
    @attendance = Attendance.find(params[:event_id])
    #@participant = @attendance.attendee_id
  end

  def create
    @event = Event.find(params[:event_id])
    # Amount in cents
    @amount = @event.price

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Paiement du participant', #{@attendee.first_name} #{@attendee.last_name}
      :currency    => 'eur'
    )

    @attendance = Attendance.new(attendee_id: current_user.id, event_id: params[:event_id])
    #flash[:success] = "Vous participez à l'évènement"
    #redirect_to @event
    if @attendance.save     
      redirect_to event_path(@event)
      flash[:success] = "Vous participez à l'évènement"
    else
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to event_path

  end

end
