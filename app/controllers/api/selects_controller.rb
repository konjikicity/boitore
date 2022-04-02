class Api::SelectsController < ApplicationController
  def index
    sentence = Sentence.where(mode_id: params[:mode_id]).select(:id, :normal, :mode_id).order(:id)
    render json: sentence
  end

  def show
    sentence = Sentence.find(params[:id])
    render json: sentence
  end
end
