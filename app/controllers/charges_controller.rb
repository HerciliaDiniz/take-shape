class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order, only: [:new, :create]
  before_action :amount, only: [:new, :create]

  layout 'charges'

  def new
  end
  
  def create

    charge = Stripe::Charge.create(
      :amount      => (@amount * 100).to_i,
      :currency    => "cad",
      :source      => params[:stripeToken], 
      :description => "Charge for order ID: #{@order.id}"
    )

    @order.update!(stripe_txn_id: charge.id)

    # redirect_to @order, notice: 'Thanks for the purchase!'
    render json: { redirect_url: root_path }

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




