class Api::PlayResultsController < ApplicationController
  before_action :play_results_params, only: %i[create]
  before_action :authenticate_user!, only: %i[index create]

  def index
    play_results = PlayResult.where(user_id: current_user.id)
    render json: play_results
  end

  def create
    play_results = PlayResult.new(play_results_params)
    if play_results.save
      render json: { status: 200, play_results: play_results }
    else
      render json: { status: 500 }
    end
  end

  private

  def play_results_params
    params.require(:play_result).permit(
      :practiced_sentence, :practiced_normal, :practiced_boin, :normal_voice, :boin_voice,
      :judge, :score, :user_id
    )
  end
end
