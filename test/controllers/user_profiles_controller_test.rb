require "test_helper"

class UserProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_profiles_new_url
    assert_response :success
  end

  test "should get create" do
    get user_profiles_create_url
    assert_response :success
  end

  test "should get show" do
    get user_profiles_show_url
    assert_response :success
  end

  test "should get find" do
    get user_profiles_find_url
    assert_response :success
  end

  test "should get edit" do
    get user_profiles_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get user_profiles_destroy_url
    assert_response :success
  end
end
