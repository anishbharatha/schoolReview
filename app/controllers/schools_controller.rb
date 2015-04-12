class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  respond_to :html
  require 'will_paginate/array'

  def index
    if params[:query].present?
      @schools = School.search(params[:query], page: params[:page], per_page: 5)
    else
      @schools = School.all.paginate(page: params[:page], per_page: 5)
    end
  end

  def show
    @reviews = Review.where(:school_id => @school.id)
    @posts  = Post.where(:school_id => @school.id)
    @new_post = Post.new
    respond_with(@school)
  end

  def new
    @school = School.new
    respond_with(@school)
  end

  def edit
  end

  def create
    @school = School.new(school_params)
    @school.user_id = current_user.id
    @school.save
    respond_with(@school)
  end

  def update
    @school.update(school_params)
    respond_with(@school)
  end

  def destroy
    @school.destroy
    respond_with(@school)
  end

  private
    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:website, :aka, :name, :address, :city, :category, :state, :user_id, :school_logo, :school_logo_cache, :remove_school_logo, :remote_school_logo_url)
    end
end
