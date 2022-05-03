# == Schema Information
#
# Table name: modes
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  difficulty  :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_modes_on_difficulty  (difficulty) UNIQUE
#
require 'rails_helper'

RSpec.describe Mode, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
