class FinalProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_final_product, only: [:show, :edit, :update, :destroy]

  def index
    @final_products = FinalProduct.all.with_attached_images
  end

  def show
  end

  def new
    @arts = Art.all
    @items = Item.all
    @final_product = FinalProduct.new
  end

  def create
    @art = Art.find params[:final_product][:art_id]
    @item = Item.find params[:final_product][:item_id]
    @final_product = FinalProduct.new final_product_params
    @final_product.art = @art
    @final_product.item = @item
    @final_product.user = current_user

    if @final_product.save
      # @final_product.images.attach params[:final_product][:images]
      redirect_to @final_product, notice: 'Successfully created!'
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @final_product.update(final_product_params)
      redirect_to @final_product, notice: 'Successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @final_product.destroy
    redirect_to final_products_path, notice: 'Successfully deleted!'
  end

  private

  def find_final_product
    @final_product = FinalProduct.find params[:id]
  end

  def final_product_params
    params.require(:final_product).permit(:title, :subtitle, :description)
  end

end
