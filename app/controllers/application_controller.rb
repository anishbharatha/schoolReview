class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :authenticate_user!
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_filter :set_current_user
  before_action :set_states

  def set_current_user
    User.current = current_user
  end

  def set_states
    @states = Hash.new
    @states = {
      'AP' => 'Andhra Pradesh',
      'AR'=>'Arunachal Pradesh',
      'AS'=>'Assam',
      'BR'=>'Bihar',
      'CG'=>'Chandigarh',
      'CH'=>'Chhattisgarh',
      'DL'=>'Delhi',
      'GA'=>'Goa',
      'GJ'=>'Gujarat',
      'HR'=>'Haryana',
      'HP'=>'Himachal Pradesh',
      'JK'=>'Jammu and Kashmir',
      'JH'=>'Jharkand',
      'KA'=>'Karnataka',
      'KL'=>'Kerala',
      'MP'=>'Madhya Pradesh',
      'MH'=>'Maharashtra',
      'MN'=>'Manipur',
      'ML'=>'Meghalaya',
      'MZ'=>'Mizoram',
      'NL'=> 'Nagaland',
      'OD'=>'Odisha',
      'PB'=>'Punjab',
      'RJ'=>'Rajasthan',
      'SK'=>'Sikkim',
      'TN'=>'Tamilnadu',
      'TS'=>'Telangana',
      'TR'=>'Tripura',
      'UP'=>'Uttar Pradesh',
      'UK'=>'Uttarakhand',
      'WB'=>'West Bengal'
    }
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