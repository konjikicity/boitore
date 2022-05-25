class Admins::ApplicationController < ::ApplicationController
  add_flash_types :success, :info, :warning, :danger
  layout 'admins/layouts/application'
  before_action :authenticate_admin!
end
