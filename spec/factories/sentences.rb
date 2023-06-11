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
FactoryBot.define do
  factory :sentence do
    boin { "こんにちは" }
    normal { "おんいいあ" }
    association :mode
  end
end
