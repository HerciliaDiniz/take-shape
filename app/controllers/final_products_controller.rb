class FinalProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = FinalProduct.all
  end

  def show
  end

  def new
    @products = FinalProduct.new
  end

  def create
    @product = FinalProduct.new(product_params) 

    if @product.save
      redirect_to @product, notice: 'Successfully created!'
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Successfully deleted!'
  end

  private

  def find_product
    @product = FinalProduct.find params[:id]
  end

  def product_params
    params.require(:final_product).permit(:title, :subtitle, :description, :image, :price)
  end

end
