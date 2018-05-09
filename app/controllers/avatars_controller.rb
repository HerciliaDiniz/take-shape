class AvatarsController < ApplicationController

  def update
    @user = User.find params[:id]
    @user.avatar.attach(params.require(:avatar))
    redirect_to @user
  end

  # look into that

end
