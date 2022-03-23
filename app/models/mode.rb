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
  enum difficulty: { "かんたん": 0, "ふつう": 1, "むずかしい": 2 }
end
