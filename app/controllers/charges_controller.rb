class ChargesController < ApplicationController

  def new
  end

  def create
    
    #@event = Event.find(params[:id]) #PROBLEME ICI
    @event = Event.find_by(params[:id])
 
    @amount = @event.price # en centimes

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

    @event.attendees << current_user
    flash[:success] = "Vous etes bien inscrits à l'event !"
    redirect_to @event

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to @event
    end

end