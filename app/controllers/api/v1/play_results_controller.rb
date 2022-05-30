class Api::V1::PlayResultsController < Api::V1::ApplicationController
  before_action :play_results_params, only: %i[create]
  before_action :authenticate_api_v1_user!

  def index
    @play_results = PlayResult.where(user_id: current_api_v1_user.id)
    render 'jb/play_result/index.json.jb'
  end

  def create
    play_results = PlayResult.new(play_results_params)
    if play_results.save
      render json: { status: 200, play_results: play_results }
    else
      render json: { status: 500 }
    end
  end

  def destroy
    play_results = PlayResult.find(params[:id])
    play_results.remove_normal_voice!
    play_results.remove_boin_voice!
    play_results.save
    play_results.destroy
    render json: true
  end

  private

  def play_results_params
    params.require(:play_result).permit(
      :practiced_sentence, :practiced_normal, :practiced_boin, :normal_voice, :boin_voice,
      :judge, :score, :user_id
    )
  end
end
