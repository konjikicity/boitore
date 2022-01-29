class Api::SelectsController < ApplicationController
  def index
    normal = Sentence.all
    render json: normal
  end
end
