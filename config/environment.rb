# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings =   {
    :address            => 'smtp.gmail.com',
    :port               => 587,
    :domain             => 'gmail.com', #you can also use google.com
    :authentication     => :plain,
    :user_name          => ENV['GMAIL_LOGIN'],
    :password           => ENV['GMAIL_PWD'],
    enable_starttls_auto: true
  }


  #
  # config.action_mailer.delivery_method = :smtp
  #   config.action_mailer.smtp_settings = {
  #     address: ENV["host"],
  #     port:                 587,
  #     domain:               'gmail.com',
  #     user_name: ENV["username"],
  #     password: ENV["password"],
  #     authentication:       'plain',
  #     enable_starttls_auto: true
  #   }
  #
  # config.action_mailer.smtp_settings = {
  #     address: ENV["host"],
  #     port:                 587,
  #     domain:               'gmail.com',
  #     user_name: ENV["username"],
  #     password: ENV["password"],
  #     authentication:       'plain',
  #     enable_starttls_auto: true
  #   }
