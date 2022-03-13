class Api::SelectsController < ApplicationController
  def index
    sentence = Sentence.select(:id, :boin, :normal)
    render json: sentence
  end

  def show
    sentence = Sentence.find(params[:id])
    render json: sentence
  end
end
