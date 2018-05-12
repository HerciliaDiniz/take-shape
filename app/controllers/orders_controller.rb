class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order, only: [:show, :edit, :update, :destroy]
 
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.buyer_id = current_user.id
    @order.total_amount = @current_cart.line_items.map(&:total_price).sum
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to new_order_charge_path(@order)
    else
      render :new
    end
  end

  private

  def find_order
    @order = Order.find params[:id]
  end

  def order_params
    params.require(:order).permit(
      :first_name, 
      :last_name, 
      :email, 
      :address, 
      :unit, 
      :city, 
      :country, 
      :state, 
      :postal_code, 
      :phone, 
      :payment_method
    )
  end

end
