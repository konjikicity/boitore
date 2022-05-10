# == Schema Information
#
# Table name: modes
#
#  id          :bigint           not null, primary key
#  description :string(30)       not null
#  difficulty  :string(10)       not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_modes_on_difficulty  (difficulty) UNIQUE
#
require 'rails_helper'

RSpec.describe Mode, type: :model do
  let(:mode){ create(:mode) }

  describe 'バリデーション確認' do
    context '正常系' do
      it 'モードが正常に作成されること' do
        expect(mode.valid?).to be true
      end
    end

    context 'エラー系' do
      it 'difficultyカラムが空欄の場合' do
        mode.difficulty = ''
        expect(mode.valid?).to be false
        expect(mode.errors[:difficulty]).to eq ["を入力してください"]
      end

      it 'descriptionカラムが空欄の場合' do
        mode.description = ''
        expect(mode.valid?).to be false
        expect(mode.errors[:description]).to eq ["を入力してください"]
      end

      it 'difficultyカラムが10文字以上の場合' do
        mode.difficulty = Faker::Lorem.characters(number:11)
        expect(mode.valid?).to be false
        expect(mode.errors[:difficulty]).to eq ["は10文字以内で入力してください"]
      end

      it 'descriptionカラムが30文字以上の場合' do
        mode.description = Faker::Lorem.characters(number:31)
        expect(mode.valid?).to be false
        expect(mode.errors[:description]).to eq ["は30文字以内で入力してください"]
      end

      it 'difficultyカラムが重複している場合' do
        mode = create(:mode)
        mode_with_duplicated_difficulty = build(:mode, difficulty: mode.difficulty)
        expect(mode_with_duplicated_difficulty.valid?).to be false
        expect(mode_with_duplicated_difficulty.errors[:difficulty]).to eq ["はすでに存在します"]
      end 
    end
    
  end
end
