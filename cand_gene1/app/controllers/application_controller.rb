class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      @project_name = "HV Gene Safari"
      @remote_user = User.find_by_username(username)
    end
  end
end
