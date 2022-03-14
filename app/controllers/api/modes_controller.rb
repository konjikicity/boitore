class Api::ModesController < ApplicationController
  def index
    modes = Mode.select(:id, :difficulty, :description)
    render json: modes
  end
end
