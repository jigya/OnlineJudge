require 'test_helper'

class ProblemInContestsControllerTest < ActionController::TestCase
  setup do
    @problem_in_contest = problem_in_contests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problem_in_contests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problem_in_contest" do
    assert_difference('ProblemInContest.count') do
      post :create, problem_in_contest: { contest_id: @problem_in_contest.contest_id, problem_id: @problem_in_contest.problem_id }
    end

    assert_redirected_to problem_in_contest_path(assigns(:problem_in_contest))
  end

  test "should show problem_in_contest" do
    get :show, id: @problem_in_contest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problem_in_contest
    assert_response :success
  end

  test "should update problem_in_contest" do
    patch :update, id: @problem_in_contest, problem_in_contest: { contest_id: @problem_in_contest.contest_id, problem_id: @problem_in_contest.problem_id }
    assert_redirected_to problem_in_contest_path(assigns(:problem_in_contest))
  end

  test "should destroy problem_in_contest" do
    assert_difference('ProblemInContest.count', -1) do
      delete :destroy, id: @problem_in_contest
    end

    assert_redirected_to problem_in_contests_path
  end
end
