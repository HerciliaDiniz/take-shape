class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.with_attached_images.map { |item| item.as_json.merge({ images: item.images.map {|img| img.variant(resize: "300x300").processed.service_url }.as_json }) }
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params) 
    @item.user = current_user
    if @item.save
      @item.images.attach params[:item][:images]
      redirect_to @item, notice: 'Successfully created!'
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'Successfully deleted!'
  end

  private

  def find_item
    @item = Item.find params[:id]
  end

  def item_params
    params.require(:item).permit(:title, :subtitle, :description, :price)
  end

end
