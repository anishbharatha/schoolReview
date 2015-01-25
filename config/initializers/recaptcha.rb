Recaptcha.configure do |config|
  config.public_key = ENV['RECAPTCHA_SITE_KEY'] #'6LfpQgATAAAAAHKPM2Z2cTNvHL3N_wUkLF0usUoC' # key_file['recaptcha']['site_key'].to_s
  config.private_key  = ENV['RECAPTCHA_SECRET_KEY'] #6LfpQgATAAAAAHT2Tyge3I8qugs2fdC7NUiQsSWP' # key_file['recaptcha']['secret_key'].to_s
  config.proxy = 'http://www.google.com/recaptcha/api/verify'
end