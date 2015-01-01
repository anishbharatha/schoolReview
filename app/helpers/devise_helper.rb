module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages#.map { |msg| content_tag(:li, msg) }.join
    flash.now[:alert]=messages
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end