# == Schema Information
#
# Table name: modes
#
#  id          :bigint           not null, primary key
#  description :string
#  difficulty  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Mode < ApplicationRecord
  has_many :sentences, dependent: :destroy
  enum difficulty: { easy: 0, normal: 1, hard: 2 }
end
