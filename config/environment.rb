# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


#Beginning code to setting up a mailing server

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :authentication => :login,
   :user_name => "",
   :password => ""
 }