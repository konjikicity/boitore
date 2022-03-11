class AddModeIdToSentences < ActiveRecord::Migration[6.1]
  def change
    add_reference :sentences, :mode, foreign_key: true
  end
end
