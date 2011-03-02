require 'test_helper'

class WorkflowCommentsControllerTest < ActionController::TestCase
  setup do
    @workflow_comment = workflow_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workflow_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workflow_comment" do
    assert_difference('WorkflowComment.count') do
      post :create, :workflow_comment => @workflow_comment.attributes
    end

    assert_redirected_to workflow_comment_path(assigns(:workflow_comment))
  end

  test "should show workflow_comment" do
    get :show, :id => @workflow_comment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @workflow_comment.to_param
    assert_response :success
  end

  test "should update workflow_comment" do
    put :update, :id => @workflow_comment.to_param, :workflow_comment => @workflow_comment.attributes
    assert_redirected_to workflow_comment_path(assigns(:workflow_comment))
  end

  test "should destroy workflow_comment" do
    assert_difference('WorkflowComment.count', -1) do
      delete :destroy, :id => @workflow_comment.to_param
    end

    assert_redirected_to workflow_comments_path
  end
end
