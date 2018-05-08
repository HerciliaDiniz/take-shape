class ConfirmationsController < ApplicationController

  def show
    user = User.find_by_token params[:id]
    if user
      user.update confirmed_at: Time.now
    else
      render plain: 'Not found!'
    end
  end

end
