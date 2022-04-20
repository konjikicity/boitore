class Api::PlayResultsController < ApplicationController

  def create
    user = User.find_by(email: params[:uid])
    play_results = PlayResult.new(user_id: user.id, practiced_sentence: params[:practiced_sentence], practiced_normal: params[:practiced_normal], 
    practiced_boin: params[:practiced_boin], normal_voice: params[:normal_voice], boin_voice: params[:boin_voice], judge: params[:judge], score: params[:score])
    play_results.save
  end

end
