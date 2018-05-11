class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end
  
  def create
    @order = Order.find params[:order_id]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :amount      => (@order.amount * 100).to_i,
      :currency    => "cad",
      :source      => params[:stripe_token], 
      :description => "Charge for order ID: #{@order.id}",
      :customer    => customer.id
    )
    redirect_to @order, notice: 'Thanks for the purchase!'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end




