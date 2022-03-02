class Api::SelectsController < ApplicationController
  def index
    sentence = Sentence.all
    render json: sentence
  end

  def show
    sentence = Sentence.find(params[:id])
    render json: sentence
  end
end
