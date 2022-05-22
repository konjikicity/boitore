class Api::ModesController < ApplicationController
  def index
    modes = Mode.all.order(:id)
    render json: modes, each_serializer: ModeSerializer
  end
end
