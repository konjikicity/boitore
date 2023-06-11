# == Schema Information
#
# Table name: modes
#
#  id          :integer          not null, primary key
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
  describe '必須項目のバリデーション確認' do
    context '全カラムの値を指定しているとき' do
      let(:mode) { create(:mode) }

      it 'modeのレコードが作成される' do
        expect(mode).to be_valid
      end
    end

    context 'difficultyカラムを指定していないとき' do
      let(:mode) { build(:mode, difficulty: nil) }

      it 'エラーになる' do
        mode.valid?
        expect(mode.errors.messages[:difficulty]).to include "を入力してください"
      end
    end

    context 'descriptionカラムを指定していないとき' do
      let(:mode) { build(:mode, description: nil) }

      it 'エラーになる' do
        mode.valid?
        expect(mode.errors.messages[:description]).to include "を入力してください"
      end
    end
  end

  describe '文字制限のバリデーション確認' do
    context 'diffcultyカラムが10文字以上のとき' do
      let(:mode){ build(:mode, difficulty: Faker::Lorem.characters(number:11) )}
      
      it 'エラーになる' do
        mode.valid?
        expect(mode.errors.messages[:difficulty]).to include "は10文字以内で入力してください"
      end
    end

    context 'descriptionカラムが30文字以上のとき' do
      let(:mode){ build(:mode, description: Faker::Lorem.characters(number:31) )}
      
      it 'エラーになる' do
        mode.valid?
        expect(mode.errors.messages[:description]).to include "は30文字以内で入力してください"
      end
    end
  end

  describe "重複のバリデーション確認" do
    context "保存されたdiffucultyカラムと重複しているとき" do
      let(:mode1) { create(:mode) }
      let(:mode2) { build(:mode, difficulty: mode1.difficulty) }

      it "エラーになる" do
        mode2.valid?
        expect(mode2.errors.messages[:difficulty]).to include "はすでに存在します"
      end
    end
  end
end
