class ApplicationController < ActionController::Base
  protect_from_forgery
  @remote_user = User.find_by_username(ENV['REMOTE_USER'] || 'pchines')
end
