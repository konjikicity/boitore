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
class Mode < ApplicationRecord
  has_many :sentences, dependent: :destroy

  validates :difficulty, uniqueness: true, presence: true, length: { maximum: 10 }
  validates :description, presence: true,  length: { maximum: 30 }
end
