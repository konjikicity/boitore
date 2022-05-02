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
class Mode < ApplicationRecord
  has_many :sentences, dependent: :destroy
  
  validates :difficulty, uniqueness: true, presence: true
  validates :description, presence: true
  enum difficulty: { "かんたん": 0, "ふつう": 1, "むずかしい": 2 }
end
