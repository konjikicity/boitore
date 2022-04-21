class Api::PlayResultsController < ApplicationController
  before_action :authenticate_user!, except: %i[create show]
  before_action :play_results_params, only: %i[create]
  skip_before_action :verify_authenticity_token

  def show
    play_result = PlayResult.where(user_id: params[:user_id])
    render json: play_result
  end

  def create
    play_results = PlayResult.new(play_results_params)
    play_results.save
  end
  
  private
   
  def play_results_params
    params.require(:play_result).permit(
      :practiced_sentence, :practiced_normal, :practiced_boin, :normal_voice, :boin_voice,
      :judge, :score, :user_id)
  end

end
