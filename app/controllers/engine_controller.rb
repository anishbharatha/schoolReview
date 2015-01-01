class EngineController < ApplicationController
  before_action :set_engine, only: [:show, :edit, :update]
  respond_to :html, :json
  require 'will_paginate/array'

  def landingPage
    @reviews = Review.all
    respond_with(@reviews)
  end

  def index
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

end
