class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :current_cart
  
  private
  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def current_user

    if session[:user_id].present?
      @_current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(:id => session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end

  helper_method :current_user

  def authenticate_user!
    unless user_signed_in?
      flash[:alert] =  "You must sign in or sign up first!"
      redirect_to new_session_path
    end
  end
end
