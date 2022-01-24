class Api::SentencesController < ApplicationController
  def index
    @sentence = Sentence.normal.all
    render json: @sentences
  end
end
