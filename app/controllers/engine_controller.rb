class EngineController < ApplicationController
  before_action :authenticate_user!, only: [:developerPage]
  load_and_authorize_resource only: [:developerPage]
  respond_to :html, :json
  require 'will_paginate/array'

  def landingPage
    @reviews = Review.all.order('created_at DESC')
    @current_user = User.current
    respond_with @reviews
  end

  def index
    params.keys.map(&:to_sym)
    @users=(params[:search])?User.where('public_name LIKE ? OR email LIKE ? OR role LIKE ?','%'+params[:search]+'%','%'+params[:search]+'%','%'+params[:search]+'%').paginate(:page => params[:page], :per_page => 10):User.all.paginate(:page => params[:page], :per_page => 10)
    respond_with @users
  end

  def updateUserRole
    @user = User.find(params[:id])
    if @user.update_attribute(:role, params[:role])
      render :nothing=>true, :status =>'200'
    else
      format.json { render json: @user.errors, status: :unprocessable_entity }
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
    @reviews_count  = Review.count
    @schools_count  = School.count
    @users_count    = User.count
    @user_agent     = request.env['HTTP_USER_AGENT']
    @remote_ip      = request.remote_ip
    @audits      = Audit.all
    if Rails.env=='production'
      @logs = File.read("#{Rails.root.to_s}/log/production.log")
    else
      @logs = File.read("#{Rails.root.to_s}/log/development.log")
    end
  end

  def contactUs
    if request.post?
      logger.debug '**CONTACT US POST**'
      PostMan.contact_us_email(params)
      respond_to do |format|
        format.html { redirect_to contact_us_path, notice: 'Successfully Sent. Thank you for contacting us.' }
        format.json { render json: contact_us_path, status: :created, location: contact_us_path}
      end
    end
  end
end
