require 'test_helper'

class Api::NotesControllerTest < ActionController::TestCase

  test "listing notes when user is not logged-in should be impossible" do
    get :index
    assert_response :unauthorized
  end

  test "listing of notes should not be possible if user is non-existent" do
    login_via_http_basic_auth("nobody@yopmail.com", "")
    get :index
    assert_response :unauthorized
  end

  test "listing of notes should not be if invalid user login is given" do
    create_user("jimmy.anon@yopmail.com", "letmein123")
    login_via_http_basic_auth("nobody@yopmail.com", "")
    get :index
    assert_response :unauthorized
  end

  test "listing notes when user is logged-in should be possible" do
    create_user("jimmy.anon@yopmail.com", "letmein123")
    login_via_http_basic_auth("jimmy.anon@yopmail.com", "letmein123")
    get :index
    assert_response :success
  end

  test "showing a single note when user is not logged-in should be impossible" do
    get :show, params: { id: 1 }
    assert_response :unauthorized
  end

  test "showing a single note when user is logged-in should be possible" do
    create_user("jimmy.anon@yopmail.com", "letmein123")
    login_via_http_basic_auth("jimmy.anon@yopmail.com", "letmein123")
    get :show, params: { id: 1 }
    assert_response :success
  end

  test "creating a note when user is not logged-in should be impossible" do
    post :create, params: { id: 1, body: "hello, world" }
    assert_response :unauthorized
  end

  test "creating a note when user is logged-in should be possible" do
    create_user("jimmy.anon@yopmail.com", "letmein123")
    login_via_http_basic_auth("jimmy.anon@yopmail.com", "letmein123")
    post :create, params: { id: 1, body: "hello, world" }
    assert_response :success
  end

  test "updating a note when user is not logged-in should be impossible" do
    put :update, params: { id: 1, body: "hello, world" }
    assert_response :unauthorized
  end

  test "updating a note when user is logged-in should be possible" do
    create_user("jimmy.anon@yopmail.com", "letmein123")
    login_via_http_basic_auth("jimmy.anon@yopmail.com", "letmein123")
    put :update, params: { id: 1, body: "hello, world" }
    assert_response :success
  end

  test "deleteing a note when user is not logged-in should be impossible" do
    put :destroy, params: { id: 1 }
    assert_response :unauthorized
  end

  test "deleteing a note when user is logged-in should be possible" do
    create_user("jimmy.anon@yopmail.com", "letmein123")
    login_via_http_basic_auth("jimmy.anon@yopmail.com", "letmein123")
    delete :destroy, params: { id: 1 }
    assert_response :success
  end

end
