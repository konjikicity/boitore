class Admin::ModesController < Admin::BaseController
  before_action :set_mode, only: %i[edit update show destroy]
  
  def index
    @modes = Mode.all.order(:id)
  end

  def new
   @mode = Mode.new
  end

  def edit; end

  def create
    @mode = Mode.new(mode_params)
    if @mode.save
      redirect_to admin_modes_path, success: t('defaults.message.created', item: Mode.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Mode.model_name.human)
      render :new
    end
  end

  def update
    if @mode.update(mode_params)
      redirect_to admin_mode_path(@mode), success: t('defaults.message.updated', item: Mode.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Mode.model_name.human)
      render :edit
    end
  end

  def show; end

  def destroy
    @mode.destroy!
    redirect_to admin_modes_path, success: t('defaults.message.deleted', item: Mode.model_name.human)
  end

  private

  def set_mode
    @mode = Mode.find(params[:id])
  end

  def mode_params
    params.require(:mode).permit(:difficulty, :description)
  end
end