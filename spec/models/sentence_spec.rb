# == Schema Information
#
# Table name: sentences
#
#  id         :bigint           not null, primary key
#  boin       :string(20)       not null
#  normal     :string(20)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mode_id    :bigint
#
# Indexes
#
#  index_sentences_on_boin     (boin) UNIQUE
#  index_sentences_on_mode_id  (mode_id)
#  index_sentences_on_normal   (normal) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (mode_id => modes.id)
#
require 'rails_helper'

RSpec.describe Sentence, type: :model do
  let(:sentence){ create(:sentence) }

  describe 'バリデーション確認' do
    context '正常系' do
      it 'sentenceが正常に作成されること' do
        expect(sentence.valid?).to be true
      end
    end

    context 'エラー系' do
      it 'boinカラムが空欄の場合' do
        sentence.boin = ''
        expect(sentence.valid?).to be false
        expect(sentence.errors[:boin]).to eq ["を入力してください"]
      end

      it 'normalカラムが空欄の場合' do
        sentence.normal = ''
        expect(sentence.valid?).to be false
        expect(sentence.errors[:normal]).to eq ["を入力してください"]
      end

      it 'boinカラムが20文字以上の場合' do
        sentence.boin = Faker::Lorem.characters(number:21)
        expect(sentence.valid?).to be false
        expect(sentence.errors[:boin]).to eq ["は20文字以内で入力してください"]
      end

      it 'normalカラムが20文字以上の場合' do
        sentence.normal = Faker::Lorem.characters(number:21)
        expect(sentence.valid?).to be false
        expect(sentence.errors[:normal]).to eq ["は20文字以内で入力してください"]
      end

      it 'boinカラムが重複している場合' do
        sentence = create(:sentence)
        sentence_with_duplicated_boin = build(:sentence, boin: sentence.boin)
        expect(sentence_with_duplicated_boin.valid?).to be false
        expect(sentence_with_duplicated_boin.errors[:boin]).to eq ["はすでに存在します"]
      end 

      it 'normalカラムが重複している場合' do
        sentence = create(:sentence)
        sentence_with_duplicated_normal = build(:sentence, normal: sentence.normal)
        expect(sentence_with_duplicated_normal.valid?).to be false
        expect(sentence_with_duplicated_normal.errors[:normal]).to eq ["はすでに存在します"]
      end
    end
    
  end
end
