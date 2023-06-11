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
class Sentence < ApplicationRecord
  belongs_to :mode

  validates :normal, uniqueness: true, presence: true, length: { maximum: 20 }
  validates :boin, uniqueness: true, presence: true, length: { maximum: 20 }
end
