class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html, :json

  def index
    @reviews = Review.all.order(:is_approved).paginate(page: params[:page], per_page: 10)
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = Review.new
    @schools = School.select(:id, :name, :address)
    respond_with(@review, @schools)
  end

  def edit
    @schools = School.all
    @review.is_approved=false
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    respond_with(@review)
  end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  def approve
    @review = Review.find(params[:id])
    if @review.update_attribute(:is_approved, true)
      render :nothing=>true, :status =>'200'
    else
      format.json { render json: @review.errors, status: :unprocessable_entity }
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:headline, :faculty_expertise, :faculty_communication, :cost_worth, :transport,
                                     :library, :satisfaction_rate, :infrastructure, :sports, :research, :any_comments,
                                     :is_approved, :user_id, :school_id)
    end
end
