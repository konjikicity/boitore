class Api::V1::ModesController < Api::V1::ApplicationController
  def index
    modes = Mode.all.order(:id)
    render json: modes, each_serializer: ModeSerializer
  end
end
