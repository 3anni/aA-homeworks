class UserMailer < ApplicationMailer
  # implement a welcome_email method that will email a user from
  # 99catsadmin@appacademy.io.
  # You don't actuallyy have an email address stored for the user;
  # for now, just pretend that their username will be an email address


  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: user.username, subject: 'Welcome to My Awesome Website')
  end

end
