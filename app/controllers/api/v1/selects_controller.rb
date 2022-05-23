class Api::V1::SelectsController <  Api::V1::ApplicationController
  def index
    sentences = Sentence.where(mode_id: params[:mode_id])
    render json: sentences, each_serializer: SentenceSerializer
  end

  def show
    sentence = Sentence.find(params[:id])
    render json: sentence, serializer: SentenceSerializer
  end
end
