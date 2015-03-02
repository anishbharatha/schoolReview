class EngineController < ApplicationController
#  before_action :authenticate_user!
  respond_to :html, :json
  require 'will_paginate/array'

  def landingPage
    @reviews = Review.all.order('created_at DESC')
    @current_user = User.current
    respond_with(@reviews, @current_user)
  end

  def index
    params.keys.map(&:to_sym)
    @users=(params[:search])?User.where('public_name LIKE ? OR email LIKE ? OR role LIKE ?','%'+params[:search]+'%','%'+params[:search]+'%','%'+params[:search]+'%').paginate(:page => params[:page], :per_page => 10):User.all.paginate(:page => params[:page], :per_page => 10)
    respond_with(@users)
  end

  def updateUserRole
      #render(:file => File.join(Rails.root, '/422.html'), :status => 403, :layout => false)

    @user = User.find(params[:id])
    @user.update_attribute(:role, params[:role])

    @users = User.all
    respond_with(@users) do |format|
      format.html {redirect_to engine_index_path }
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def developerPage
    @reviews_count  = Review.all.count
    @schools_count  = School.all.count
    @users_count    = User.all.count
    @user_agent     = request.env['HTTP_USER_AGENT']
    @remote_ip      = request.remote_ip
    if Rails.env=='production'
      @logs = File.read("#{Rails.root.to_s}/log/production.log")
    else
      @logs = File.read("#{Rails.root.to_s}/log/development.log")
    end
  end
end
