class ArtsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_art, only: [:show, :edit, :update, :destroy]

  def index
    @arts = Art.with_attached_images.map { | art | art.as_json.merge({
        images: art.images.map { | img | resolve_image_url(img.variant(resize: "300x300"))
        }.as_json
      })
    }
  end

  def show
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params) 
    @art.user = current_user 

    if @art.save
      @art.images.attach params[:art][:images]
      redirect_to @art, notice: 'Successfully created!'
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @art.update(art_params)
      if params[:art][:images]
        @art.images.attach params[:art][:images]
      end
      redirect_to @art, notice: 'Successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @art.destroy
    @art.images.purge
    redirect_to arts_path, notice: 'Successfully deleted!'
  end

  private

  def find_art
    @art = Art.find params[:id]
  end

  def art_params
    params.require(:art).permit(:title, :subtitle, :description, :price)
  end

end
