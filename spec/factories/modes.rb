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
FactoryBot.define do
  factory :mode do
    sequence(:difficulty) { |n| "#{n}かんたん" }
    description { "簡単な挨拶を練習する言葉です" }

    trait :normal do
      sequence(:difficulty){|n| "#{n}ふつう"}
      description { "普通の挨拶を練習する言葉です" }
    end
  end
end
