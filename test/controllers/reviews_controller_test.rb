require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post :create, review: { any_comments: @review.any_comments, cost_worth: @review.cost_worth, faculty_communication: @review.faculty_communication, faculty_expertise: @review.faculty_expertise, infrastructure: @review.infrastructure, is_approved: @review.is_approved, library: @review.library, research: @review.research, satisfaction_rate: @review.satisfaction_rate, school_id: @review.school_id, sports: @review.sports, transport: @review.transport, user_id: @review.user_id }
    end

    assert_redirected_to review_path(assigns(:review))
  end

  test "should show review" do
    get :show, id: @review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review
    assert_response :success
  end

  test "should update review" do
    patch :update, id: @review, review: { any_comments: @review.any_comments, cost_worth: @review.cost_worth, faculty_communication: @review.faculty_communication, faculty_expertise: @review.faculty_expertise, infrastructure: @review.infrastructure, is_approved: @review.is_approved, library: @review.library, research: @review.research, satisfaction_rate: @review.satisfaction_rate, school_id: @review.school_id, sports: @review.sports, transport: @review.transport, user_id: @review.user_id }
    assert_redirected_to review_path(assigns(:review))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, id: @review
    end

    assert_redirected_to reviews_path
  end
end
