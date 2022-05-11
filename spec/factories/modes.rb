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
    difficulty { "こんにちは" }
    description { "簡単な挨拶を練習する言葉です" }
  end
end
