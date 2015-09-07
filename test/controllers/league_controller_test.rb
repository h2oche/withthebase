require 'test_helper'

class LeagueControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get info" do
    get :info
    assert_response :success
  end

  test "should get draft" do
    get :draft
    assert_response :success
  end

  test "should get lineup" do
    get :lineup
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
