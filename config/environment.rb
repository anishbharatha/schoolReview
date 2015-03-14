# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SchoolReview::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name            => ENV['SENDGRID_USERNAME'],
  :password             => ENV['SENDGRID_KEY'],
  :domain               => 'https://vast-bastion-9882.herokuapp.com',
  :address              => 'smtp.sendgrid.net',
  :port                 => 587,
  :authentication       => :plain,
  :enable_starttls_auto => false,
  :openssl_verify_mode  => 'none'
}
ActionMailer::Base.default_url_options = { host: 'https://afternoon-temple-3577.herokuapp.com'}