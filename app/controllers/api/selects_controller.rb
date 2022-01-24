class Api::SelectsController < ApplicationController
  def index
    normal = Sentence.select(:id,:normal)
    render json: normal
  end
end
