class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Basic::ControllerMethods

  protected

  def authenticate_user!
    authenticate_or_request_with_http_basic do |email, password|
      user = User.find_by_email(email)
      if user && user.valid_password?(password)
        @current_user = user
      end
      @current_user.present?
    end
  end

  def current_user
    unless @current_user
      @current_user = authenticate_with_http_basic do |email, password|
        user = User.find_by_email(email)
        if user && user.valid_password?(password)
          user
        end
      end
      @current_user
    else
      @current_user
    end
  end

end
