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
    @order.buyer_id = current_user
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :email, :address, :payment_method)
  end

end
