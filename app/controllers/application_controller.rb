class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :authenticate_user!
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_filter :set_current_user

  def set_current_user
    User.current = current_user
  end

  #Below methods are to override the same methods in devise gem so it supports new fields in user model
  protected

  def configure_devise_permitted_parameters
    registration_params = [:public_name, :full_name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end

end