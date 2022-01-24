# == Schema Information
#
# Table name: sentences
#
#  id         :bigint           not null, primary key
#  boin       :string           not null
#  normal     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sentence < ApplicationRecord
  validates :normal, presence: true, uniqueness: true
  validates :boin, presence: true, uniqueness: true
end
