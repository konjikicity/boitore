class Admins::ModesController < Admins::ApplicationController
  before_action :set_mode, only: %i[edit update show destroy]

  def index
    @modes = Mode.all.page(params[:page]).per(8).order(:id)
  end

  def new
    @mode = Mode.new
  end

  def edit; end

  def create
    @mode = Mode.new(mode_params)
    if @mode.save
      redirect_to admins_modes_path,
                  success: t('defaults.message.created', item: Mode.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Mode.model_name.human)
      render :new
    end
  end

  def update
    if @mode.update(mode_params)
      redirect_to admins_mode_path(@mode),
                  success: t('defaults.message.updated', item: Mode.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Mode.model_name.human)
      render :edit
    end
  end

  def show; end

  def destroy
    @mode.destroy!
    redirect_to admins_modes_path,
                success: t('defaults.message.deleted', item: Mode.model_name.human)
  end

  private

  def set_mode
    @mode = Mode.find(params[:id])
  end

  def mode_params
    params.require(:mode).permit(:difficulty, :description)
  end
end
