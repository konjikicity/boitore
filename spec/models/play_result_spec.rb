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
require 'rails_helper'

RSpec.describe PlayResult, type: :model do
  let(:user){ create(:user) }
  let(:play_result){ build(:play_result, user_id: user.id) }

  describe 'バリデーション確認' do
    context '正常系' do
      it '練習結果が正常に作成されること' do
        expect(play_result.valid?).to be true
      end
    end
  end
end
