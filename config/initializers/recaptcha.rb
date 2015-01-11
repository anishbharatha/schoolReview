Recaptcha.configure do |config|
  key_file = YAML.load_file("#{Rails.root.to_s}/config/secretkeys.yml")[Rails.env]

  config.public_key = key_file['recaptcha']['site_key'].to_s
  config.private_key  = key_file['recaptcha']['secret_key'].to_s
  config.proxy = 'http://www.google.com/recaptcha/api/verify'
end