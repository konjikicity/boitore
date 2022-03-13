class Api::ModesController < ApplicationController
  def index
    mode = Mode.all
    render json: mode
  end
end
