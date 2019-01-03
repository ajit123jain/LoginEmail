class UserNotifier < ActionMailer::Base
  require 'sendgrid-ruby'
	include SendGrid	
  default :from => 'kumarajitjain@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => 'ajitkumarjain123@gmail.com',
    :subject => 'Thanks for signing up for our amazing app' )
  end
end