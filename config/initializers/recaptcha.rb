Recaptcha.configure do |config|
  key_file = YAML.load_file("#{Rails.root.to_s}/config/secretkeys.yml")[Rails.env]

  config.public_key = '6LfpQgATAAAAAHKPM2Z2cTNvHL3N_wUkLF0usUoC' # key_file['recaptcha']['site_key'].to_s
  config.private_key  = '6LfpQgATAAAAAHT2Tyge3I8qugs2fdC7NUiQsSWP' # key_file['recaptcha']['secret_key'].to_s
  config.proxy = 'http://www.google.com/recaptcha/api/verify'
end