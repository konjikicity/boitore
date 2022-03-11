# == Schema Information
#
# Table name: modes
#
#  id         :bigint           not null, primary key
#  difficulty :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Mode, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
