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
  let(:user) { create(:user) }
  let(:play_result){ build(:play_result, user_id: user.id) }
  
  describe '必須項目のバリデーション確認' do
    context '全カラムの値を指定しているとき' do
      it 'play_resultのレコードが作成される' do
        expect(play_result).to be_valid
      end
    end

    context 'boin_voiceカラムを指定していない時' do
      let(:play_result){ build(:play_result, boin_voice: nil) }

      it "エラーになる" do
        play_result.valid?
        expect(play_result.errors.messages[:boin_voice]).to include "を入力してください"
      end
    end

    context 'normal_voiceカラムを指定していない時' do
      let(:play_result){ build(:play_result, normal_voice: nil) }

      it "エラーになる" do
        play_result.valid?
        expect(play_result.errors.messages[:normal_voice]).to include "を入力してください"
      end
    end  

    context 'boin_voiceカラムを指定していない時' do
      let(:play_result){ build(:play_result, boin_voice: nil) }

      it "エラーになる" do
        play_result.valid?
        expect(play_result.errors.messages[:boin_voice]).to include "を入力してください"
      end
    end

    context 'judgeカラムを指定していない時' do
      let(:play_result){ build(:play_result, judge: nil) }

      it "エラーになる" do
        play_result.valid?
        expect(play_result.errors.messages[:judge]).to include "を入力してください"
      end
    end
    
    context 'scoreカラムを指定していない時' do
      let(:play_result){ build(:play_result, score: nil) }

      it "エラーになる" do
        play_result.valid?
        expect(play_result.errors.messages[:score]).to include "を入力してください"
      end
    end
      
    context 'practiced_boinカラムを指定していない時' do
      let(:play_result){ build(:play_result, practiced_boin: nil) }

      it "エラーになる" do
        play_result.valid?
        expect(play_result.errors.messages[:practiced_boin]).to include "を入力してください"
      end
    end
    
    context 'practiced_normalカラムを指定していない時' do
      let(:play_result){ build(:play_result, practiced_normal: nil) }

      it "エラーになる" do
        play_result.valid?
        expect(play_result.errors.messages[:practiced_normal]).to include "を入力してください"
      end
    end
  end
end
