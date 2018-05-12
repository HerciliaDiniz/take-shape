class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order, only: [:new, :create]
  before_action :amount, only: [:new, :create]

  def new
  end
  
  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :amount      => @amount,
      :currency    => "cad",
      :source      => params[:stripe_token], 
      :description => "Charge for order ID: #{@order.id}",
      :customer    => customer.id
    )
    @order.update(stripe_txn_id: charge.id) 
    redirect_to @order, notice: 'Thanks for the purchase!'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def find_order
    @order = Order.find params[:order_id] 
  end

  def amount
    @amount = @order.total_amount
  end


end




