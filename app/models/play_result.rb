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
class PlayResult < ApplicationRecord
  belongs_to :user

  validates :practiced_normal, presence: true
  validates :practiced_boin, presence: true
  validates :normal_voice, presence: true
  validates :boin_voice, presence: true
  validates :judge, presence: true
  validates :score, presence: true
  validates :practiced_sentence, presence: true

  mount_uploader :boin_voice, AudioUploader
  mount_uploader :normal_voice, AudioUploader
  
  def practice_delete
    remove_normal_voice!
    remove_boin_voice!
    save
    delete
  end
end
