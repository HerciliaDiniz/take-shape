class PagesController < ApplicationController

  def home
    @arts = Art.all
  end

  def about
  end

  def how_to_shape
  end
  
end
