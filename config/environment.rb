# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SchoolReview::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.sendgrid.net',
  :domain               => 'https://afternoon-temple-3577.herokuapp.com',
  :user_name            => ENV['SENDGRID_USERNAME'],
  :password             => ENV['SENDGRID_KEY'],
  :authentication       => 'plain',
  :enable_starttls_auto => true
}
ActionMailer::Base.default_url_options = { host: 'https://afternoon-temple-3577.herokuapp.com'}