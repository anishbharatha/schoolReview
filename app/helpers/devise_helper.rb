module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages#.map { |msg| content_tag(:li, msg) }.join
    flash.now[:alert]=messages
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

  def send_email
    # As a hash
    client = SendGrid::Client.new(api_user: ''+ENV['SENDGRID_USERNAME'], api_key: ''+ENV['SENDGRID_KEY'])
    client.send(SendGrid::Mail.new(to: 'anish.bharata@gmail.com', from: 'iReviewSchool@tester.in',
                                   subject: 'Signed In Alert', text: 'Hi there! User Signed In: '+User.current.public_name.to_s,
                                   html: 'Hi there! User Signed In: '+User.current.public_name.to_s))
  end
end