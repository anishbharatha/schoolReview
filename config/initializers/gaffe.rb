# config/initializers/gaffe.rb
Gaffe.configure do |config|
  config.errors_controller = {
      %r[^/api/] => 'Api::ErrorsController',
      %r[^/] => 'ErrorsController'
  }
  #'ErrorsController'
end

Gaffe.enable!