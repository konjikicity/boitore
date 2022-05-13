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

    context 'エラー系' do
      it '母音法の練習音声がなければ作成に失敗する' do
        play_result.boin_voice = ''
        expect(play_result.valid?).to be false
      end

      it '通常の練習音声がなければ作成に失敗する' do
        play_result.normal_voice = ''
        expect(play_result.valid?).to be false
      end

      it '判定がなければ作成に失敗する' do
        play_result.judge = ''
        expect(play_result.valid?).to be false
      end

      
      it '点数がなければ作成に失敗する' do
        play_result.score = ''
        expect(play_result.valid?).to be false
      end

      it '母音の音声認識がなければ作成に失敗する' do
        play_result.practiced_boin = ''
        expect(play_result.valid?).to be false
      end

      it '通常の音声認識がなければ作成に失敗する' do
        play_result.practiced_normal = ''
        expect(play_result.valid?).to be false
      end

    end
  end
end
