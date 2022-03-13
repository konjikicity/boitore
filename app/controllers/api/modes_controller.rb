class Api::ModesController < ApplicationController
  def index
    mode = Mode.select(:id, :difficulty)
    render json: mode
  end
end
