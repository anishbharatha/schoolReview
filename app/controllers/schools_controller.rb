class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :html
  require 'will_paginate/array'

  def index
    @schools = School.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
    respond_with(@schools)
  end

  def show
    @reviews = Review.where(:school_id => @school.id)
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
