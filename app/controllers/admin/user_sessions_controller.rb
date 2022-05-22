class Admin::UserSessionsController < Admin::BaseController
  layout 'admin/layouts/admin_login'

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to admin_root_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_login_path, success: 'ログアウトしました'
  end
end
