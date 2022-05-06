class Api::ModesController < ApplicationController
  def index
    modes = Mode.all
    render json: modes, each_serializer: ModeSerializer
  end
end
