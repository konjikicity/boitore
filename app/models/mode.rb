# == Schema Information
#
# Table name: modes
#
#  id         :bigint           not null, primary key
#  difficulty :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Mode < ApplicationRecord
  has_many :sentences

end
