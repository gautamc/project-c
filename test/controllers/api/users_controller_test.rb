require 'test_helper'

class Api::UsersControllerTest < ActionController::TestCase

  setup do
    create_user("jimmy.anon@yopmail.com", "letmein123")
  end

  test "listing user when user is not logged-in should be impossible" do
    get :index
    assert_response :unauthorized
  end

  test "listing users when user is logged-in as admin should be possible" do
    login_via_http_basic_auth("jimmy.anon@yopmail.com", "letmein123")
    get :index
    assert_response :success
  end

  test "listing a user when user is not logged-in should be impossible" do
    get :show, params: { id: 1 }
    assert_response :unauthorized
  end

  test "current_user non-admin user can view only its profile" do
    login_via_http_basic_auth("jimmy.anon@yopmail.com", "letmein123")
    get :show, params: { id: 1 }
    assert_response :success
  end

  test "updating a user when user is not logged-in should be impossible" do
    put :update, params: { id: 1, password: "12345" }
    assert_response :unauthorized
  end

  test "current_user non-admin user can update only its profile" do
    login_via_http_basic_auth("jimmy.anon@yopmail.com", "letmein123")
    put :update, params: { id: 1, password: "12345" }
    assert_response :success
  end

  test "user creation - validation" do
    post :create, params: {
      user: {
        email: "sally.anon@yopmail.com",
        password: "letmein123",
        password_confirmation: "letmein1232"
      }
    }
    assert @response.content_type == "application/json"
    errors = JSON.parse(@response.body)
    assert errors["password_confirmation"][0] == "doesn't match Password"
    assert @response.status == 422
    assert_response :unprocessable_entity
  end

  test "user creation - success" do
    post :create, params: {
      user: {
        email: "sally.anon@yopmail.com",
        password: "letmein123",
        password_confirmation: "letmein123"
      }
    }
    assert @response.content_type == "application/json"
    user = JSON.parse(@response.body)
    assert !user.key?('password')
    assert user.key?('email')
    assert user.key?('id')
    assert @response.status == 201
    assert_response :created
  end

end
