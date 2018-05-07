class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params) 

    if @item.save
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
    redirect_to items_url, notice: 'Successfully deleted!'
  end

  private

  def find_item
    @item = Item.find params[:id]
  end

  def item_params
    params.require(:item).permit(:title, :subtitle, :description, :image, :price)
  end

end
