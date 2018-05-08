class UsersMailer < ApplicationMailer

  def send_confirmation_email(user)
    @user = user
    mail(to: user.email, subject: 'Please confirm your email')
  end
  
end
