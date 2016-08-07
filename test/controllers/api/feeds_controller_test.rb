require 'test_helper'

class Api::FeedsControllerTest < ActionController::TestCase

  test "index should not require logged-in user" do
    get :index
    assert_nil assigns[:current_user]
    assert_response :success
  end

  test "index should accept a logged-in user" do
    create_user("jimmy.anon@yopmail.com", "letmein123")
    login_via_http_basic_auth("jimmy.anon@yopmail.com", "letmein123")
    get :index
    assert_not_nil assigns[:current_user]
    assert_response :success
  end

  test "show should not require logged-in user" do
    get :show, params: { id: 1 }
    assert_nil assigns[:current_user]
    assert_response :success
  end

  test "show should accept a logged-in user" do
    create_user("jimmy.anon@yopmail.com", "letmein123")
    login_via_http_basic_auth("jimmy.anon@yopmail.com", "letmein123")
    get :show, params: { id: 1 }
    assert_not_nil assigns[:current_user]
    assert_response :success
  end

end
