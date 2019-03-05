require 'test_helper'

class ChallengesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get challenges_new_url
    assert_response :success
  end

  test "should get create" do
    get challenges_create_url
    assert_response :success
  end

  test "should get edit" do
    get challenges_edit_url
    assert_response :success
  end

  test "should get update" do
    get challenges_update_url
    assert_response :success
  end

  test "should get destroy" do
    get challenges_destroy_url
    assert_response :success
  end

end
