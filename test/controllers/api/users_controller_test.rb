require 'test_helper'

class Api::UsersControllerTest < ActionController::TestCase

  test "user creation" do
    get :index
    assert_response :success
  end

  test "user login" do
  end

  test "user logout" do
  end

end
