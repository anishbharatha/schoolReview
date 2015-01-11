class User::SessionsController < Devise::SessionsController
 before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
     super
     sendgrid_api = YAML.load_file("#{Rails.root.to_s}/config/secretkeys.yml")[Rails.env]
     # As a hash
     client = SendGrid::Client.new(api_user: ''+sendgrid_api['sendgrid_api']['username'], api_key: ''+sendgrid_api['sendgrid_api']['key'])
     client.send(SendGrid::Mail.new(to: 'anish.bharata@gmail.com', from: 'iReviewSchool@tester.in',
                                    subject: 'Signed In Alert', text: 'Hi there! User Signed In: '+User.current.public_name.to_s,
                                    html: 'Hi there! User Signed In: '+User.current.public_name.to_s))
   end

  # DELETE /resource/sign_out
   def destroy
     super
   end

  # protected

  # You can put the params you want to permit in the empty array.
   def configure_sign_in_params
     devise_parameter_sanitizer.for(:sign_in) << :attribute
   end
end
