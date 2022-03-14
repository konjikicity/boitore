class Api::ModesController < ApplicationController
  def index
    modes = Mode.select(:id, :difficulty)
    render json: modes
  end
end
