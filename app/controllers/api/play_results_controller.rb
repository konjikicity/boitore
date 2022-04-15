class Api::PlayResultsController < ApplicationController
  before_action :authenticate_user!, only: %i[create show]
   
  def show

  def create
    play_results = PlayResult.new(play_result_params)
    if play_results.save
      render status: :created   
    else
      render json: play_results.errors, status: :unprocessable_entity
    end
  end

  private

  def play_result_params
    params.fetch(:play_result, {}).permit(
      :practiced_normal, :practiced_boin, :normal_voice, :boin_voice, :judge, :score, :user_id
    )
  end

end
