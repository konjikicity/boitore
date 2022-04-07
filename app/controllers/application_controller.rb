class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :null_session
end
