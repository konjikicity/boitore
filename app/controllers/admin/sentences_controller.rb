class Admin::SentencesController < Admin::ApplicationController
  before_action :set_sentence, only: %i[edit update show destroy]

  def index
    @sentences = Sentence.all.order(:id)
  end

  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)
    if @sentence.save
      redirect_to admin_sentences_path,
                  success: t('defaults.message.created', item: Sentence.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Sentence.model_name.human)
      render :new
    end
  end

  def edit; end

  def update
    if @sentence.update(sentence_params)
      redirect_to admin_sentence_path(@sentence),
                  success: t('defaults.message.updated', item: Sentence.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Sentence.model_name.human)
      render :edit
    end
  end

  def show; end

  def destroy
    @sentence.destroy!
    redirect_to admin_sentences_path,
                success: t('defaults.message.deleted', item: Sentence.model_name.human)
  end

  private

  def set_sentence
    @sentence = Sentence.find(params[:id])
  end

  def sentence_params
    params.require(:sentence).permit(:boin, :normal, :mode_id)
  end
end
