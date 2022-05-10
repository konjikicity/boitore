# == Schema Information
#
# Table name: play_results
#
#  id                 :bigint           not null, primary key
#  boin_voice         :string           not null
#  judge              :string           not null
#  normal_voice       :string           not null
#  practiced_boin     :string           not null
#  practiced_normal   :string           not null
#  practiced_sentence :string           not null
#  score              :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#
# Indexes
#
#  index_play_results_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class PlayResultSerializer < ActiveModel::Serializer
  attributes :id, :boin_voice, :judge, :normal_voice, :practiced_boin,
             :practiced_normal, :practiced_sentence, :score, :created_at, :user_id
end
