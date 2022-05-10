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
    difficulty { Faker::Lorem.characters(number:9) }
    description { Faker::Lorem.characters(number:29) }
  end
end
