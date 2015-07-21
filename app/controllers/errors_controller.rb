class ErrorsController < ApplicationController
  # Include a few Gaffe helpers
  include Gaffe::Errors

  skip_before_filter :authenticate_user!

  # Let’s use our same layout
  layout 'application'

  def show
    # The following variables are available:
     #@exception        The encountered exception (Eg. `#<ActiveRecord::NotFound …>`)
     #@status_code      The status code we should return (Eg. `404`)
     #@rescue_response  The "standard" name for the status code (Eg. `:not_found`)
    logger.debug 'ERRORS CAUGHT * ERROR CTRL.'
    logger.debug  @rescue_response.to_s+' **** '+@status_code.to_s
    render "errors/#{@rescue_response}", code: @status_code
  end
end
