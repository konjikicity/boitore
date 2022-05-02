# == Schema Information
#
# Table name: modes
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  difficulty  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_modes_on_difficulty  (difficulty) UNIQUE
#
FactoryBot.define do
  factory :mode do
    
  end
end
