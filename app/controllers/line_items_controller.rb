class LineItemsController < ApplicationController

  before_action :find_line_items, only: [:show, :edit, :update, :destroy, :add, :reduce]

  def create 
    chosen_product = FinalProduct.find(params[:final_product_id])
    current_cart = @current_cart

    if current_cart.final_products.include?(chosen_product)
      @line_item = current_cart.line_items.find_by final_product_id: chosen_product
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.final_product = chosen_product
    end

    @line_item.save
    redirect_to cart_path(current_cart)
  end

  def destroy
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end  

  def add
    @line_item.quantity += 1
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce
    if @line_item.quantity > 1
      @line_item.quantity -= 1
    end
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  private
  
  def line_item_params
    params.require(:line_item).permit(:quantity, :final_product_id, :cart_id, :order_id)
  end

  def find_line_items
    @line_item = LineItem.find(params[:id])
  end

end
