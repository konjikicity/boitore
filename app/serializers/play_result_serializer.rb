class PlayResultSerializer < ActiveModel::Serializer
  attributes :id, :boin_voice, :judge, :normal_voice, :practiced_boin,
             :practiced_normal, :practiced_sentence, :score, :created_at, :user_id               
end
