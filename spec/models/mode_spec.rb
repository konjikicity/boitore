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
  describe 'mode_validation' do

    it 'difficultyカラムが空欄の場合' do
      mode_without_difficulty = build(:mode, difficulty: "")
      expect(mode_without_difficulty).to be_invalid
      expect(mode_without_difficulty.errors[:difficulty]).to eq ["を入力してください", "は1文字以上で入力してください"]
    end

    it 'descriptionカラムが空欄の場合' do
      mode_without_description = build(:mode, description: "")
      expect(mode_without_description).to be_invalid
      expect(mode_without_description.errors[:description]).to eq ["を入力してください", "は1文字以上で入力してください"]
    end

    it 'difficultyカラムが10文字以上の場合' do
      mode_over_characters_difficulty = build(:mode, difficulty: Faker::Lorem.characters(number:11))
      expect(mode_over_characters_difficulty).to be_invalid
      expect(mode_over_characters_difficulty.errors[:difficulty]).to eq ["は10文字以内で入力してください"]
    end

    it 'difficultyカラムが20文字以上の場合' do
      mode_over_characters_description = build(:mode, description: Faker::Lorem.characters(number:31))
      expect(mode_over_characters_description).to be_invalid
      expect(mode_over_characters_description.errors[:description]).to eq ["は30文字以内で入力してください"]
    end

    it 'difficultyカラムが重複している場合' do
      mode = create(:mode)
      mode_with_duplicated_difficulty = build(:mode, difficulty: mode.difficulty)
      expect(mode_with_duplicated_difficulty).to be_invalid
      expect(mode_with_duplicated_difficulty.errors[:difficulty]).to eq ["はすでに存在します"]
    end

    it 'difficultyカラムが重複していない場合' do
      mode = create(:mode)
      mode_with_another_difficulty = build(:mode, difficulty: 'another')
      expect(mode_with_another_difficulty).to be_valid
      expect(mode_with_another_difficulty.errors).to be_empty
    end
  end
end
