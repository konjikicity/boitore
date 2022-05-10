# == Schema Information
#
# Table name: sentences
#
#  id         :bigint           not null, primary key
#  boin       :string(20)       not null
#  normal     :string(20)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mode_id    :bigint
#
# Indexes
#
#  index_sentences_on_boin     (boin) UNIQUE
#  index_sentences_on_mode_id  (mode_id)
#  index_sentences_on_normal   (normal) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (mode_id => modes.id)
#
require 'rails_helper'

RSpec.describe Sentence, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
