# == Schema Information
#
# Table name: sentences
#
#  id         :bigint           not null, primary key
#  boin       :string           not null
#  normal     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mode_id    :bigint
#
# Indexes
#
#  index_sentences_on_boin_and_normal  (boin,normal) UNIQUE
#  index_sentences_on_mode_id          (mode_id)
#
# Foreign Keys
#
#  fk_rails_...  (mode_id => modes.id)
#
FactoryBot.define do
  factory :sentence do
    boin { "MyString" }
    normal { "MyString" }
  end
end
