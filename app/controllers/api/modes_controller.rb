class Api::ModesController < ApplicationController
  def index
    sentence = Modes.all
    render json: mode
  end
end
