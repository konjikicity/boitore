class Admins::UsersController < Admins::ApplicationController
  before_action :set_user, only: %i[edit update show destroy]

  def index
    @users = User.all.page(params[:page]).per(8).order(:id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admins_users_path,
                  success: t('defaults.message.created', item: User.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: User.model_name.human)
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(update_user_params)
      redirect_to admins_user_path(@user),
                  success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  def show; end

  def destroy
    @user.destroy!
    redirect_to admins_users_path,
                success: t('defaults.message.deleted', item: User.model_name.human)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:name, :email)
  end
end
