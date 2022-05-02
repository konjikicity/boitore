class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  add_flash_types :success, :info, :warning, :danger
  skip_before_action :verify_authenticity_token
end
