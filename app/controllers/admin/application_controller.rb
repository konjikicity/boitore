class Admin::ApplicationController < ::ApplicationController
    layout 'admin/layouts/application'
    before_action :authenticate_admin!
  
    private

    def not_authenticated
      flash[:warning] = 'ログインしてください'
      redirect_to admin_login_path
    end

    def check_admin
      redirect_to admin_login_path, warning: '権限がありません' unless user.admin?
    end
  end
end
