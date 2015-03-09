class PostMan < ActionMailer::Base
  default from: 'postman@iReviewSchool.in'
  default to: 'anishbharatha@protonmail.ch'

  def contact_us_email(params)

    client = SendGrid::Client.new(api_user: ''+ENV['SENDGRID_USERNAME'], api_key: ''+ENV['SENDGRID_KEY'])
    client.send(SendGrid::Mail.new(from: params[:sender_email_id].to_s,
                                   to: 'anishbharatha@protonmail.ch',
                                   subject: 'iReviewSchool * Talk To Us',
                                   html: params[:message].to_s))
  end
end
