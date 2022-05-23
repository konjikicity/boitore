class Admin::ApplicationController < ::ApplicationController
  add_flash_types :success, :info, :warning, :danger
  layout 'admin/layouts/application'
end
