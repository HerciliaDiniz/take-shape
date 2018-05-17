class FinalProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_final_product, only: [:show, :edit, :update, :destroy]

  def index
    @final_products = FinalProduct.all
    # @final_products = FinalProduct.with_attached_images.map { |final_product| final_product.as_json.merge({ images: final_product.images.map {|img| img.variant(resize: "300x300").processed.service_url }.as_json }) }
  end

  def show
  end

  def new
    @arts = Art.with_attached_images.map { |art| art.as_json.merge({ images: art.images.map {|img| img.variant(resize: "300x300").processed.service_url }.as_json }) }
    @items = Item.with_attached_images.map { |item| item.as_json.merge({ images: item.images.map {|img| img.variant(resize: "600x600").processed.service_url }.as_json }) }
    @final_product = FinalProduct.new
  end

  def create
    @art = Art.find params[:final_product][:art][:id]
    @item = Item.find params[:final_product][:item][:id]
    @final_product = FinalProduct.new final_product_params
    @final_product.art = @art
    @final_product.item = @item
    @final_product.user = current_user

    if @final_product.save
      if params[:final_product][:images]
        @final_product.images.attach params[:final_product][:images]
      end
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
    params.require(:final_product).permit(:title, :subtitle, :description, :art, :item)
  end

end
