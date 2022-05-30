class Api::V1::SelectsController < Api::V1::ApplicationController
  def index
    @sentences = Sentence.where(mode_id: params[:mode_id])
    render 'jb/sentence/index.json.jb'
  end

  def show
    @sentence = Sentence.find(params[:id])
    render 'jb/sentence/show.json.jb'
  end
end
