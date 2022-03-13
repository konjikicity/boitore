class Api::ModesController < ApplicationController
  def index
    mode = Modes.all
    render json: mode
  end
end
