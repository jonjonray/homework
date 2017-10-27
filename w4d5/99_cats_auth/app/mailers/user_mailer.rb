class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'
  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to Cat Rentals')
  end

  

end
