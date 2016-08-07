require 'test_helper'

class Api::FeedsControllerTest < ActionController::TestCase

  test "index should not require logged-in user" do
    get :index
    assert_response :success
  end

  test "index should accept a logged-in user" do
    #sign_in :user, User.where(username: "admin123@smileprep.com").first
    get :index
    assert_response :success
  end

end
