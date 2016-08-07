class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Basic::ControllerMethods

  protected

  def authenticate_user!
    authenticate_or_request_with_http_basic do |email, password|
      user = User.find_by_email(email)
      user && user.valid_password?(password)
    end
  end

end
