# == Schema Information
#
# Table name: sentences
#
#  id         :integer          not null, primary key
#  boin       :string(20)       not null
#  normal     :string(20)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mode_id    :integer
#
# Indexes
#
#  index_sentences_on_boin     (boin) UNIQUE
#  index_sentences_on_mode_id  (mode_id)
#  index_sentences_on_normal   (normal) UNIQUE
#
# Foreign Keys
#
#  mode_id  (mode_id => modes.id)
#
require 'rails_helper'

RSpec.describe Sentence, type: :model do

  describe '必須項目のバリデーション確認' do
    context '全カラムの値を指定しているとき' do
        let(:sentence){ create(:sentence) }

      it "sentenceのレコードが作成される" do
        expect(sentence).to be_valid
      end
    end

    context "boinカラムを指定していない時" do
      let(:sentence) { build(:sentence, boin: nil) }

      it "エラーになる" do
        sentence.valid?
        expect(sentence.errors.messages[:boin]).to include "を入力してください"
      end
    end


    context "normalカラムを指定していない時" do
      let(:sentence) { build(:sentence, normal: nil) }

      it "エラーになる" do
        sentence.valid?
        expect(sentence.errors.messages[:normal]).to include "を入力してください"
      end
    end
  end

  describe "文字数制限のバリデーション確認" do
    context "boinカラムが20文字以上の場合" do
      let(:sentence) { build(:sentence, boin: Faker::Lorem.characters(number:21)) }
      
      it "エラーになる" do
        sentence.valid?
        expect(sentence.errors.messages[:boin]).to include "は20文字以内で入力してください"
      end
    end

    context "normalカラムが20文字以上の場合" do
      let(:sentence) { build(:sentence, normal: Faker::Lorem.characters(number:21)) }

      it "エラーになる" do
        sentence.valid?
        expect(sentence.errors.messages[:normal]).to include "は20文字以内で入力してください"
      end
    end
  end


  describe "重複のバリデーション確認" do
    context "boinカラムが重複しているとき" do
      let(:boin1) { create(:sentence) }
      let(:boin2) { build(:sentence, boin: boin1.boin, normal: "こんばんわ")}
      it 'エラーになる' do
        boin2.valid?
        expect(boin2.errors.messages[:boin]).to include "はすでに存在します"
      end 
    end

    context "normalカラムが重複しているとき" do
      let(:normal1) { create(:sentence) }
      let(:normal2) { build(:sentence, boin: "おんあんあ", normal: normal1.normal)}
      it 'エラーになる' do
        normal2.valid?
        expect(normal2.errors.messages[:normal]).to include "はすでに存在します"
      end 
    end
  end
end
