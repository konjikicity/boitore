class AddIndexSentencesToNormal < ActiveRecord::Migration[6.1]
  def change
    add_index :sentences, :normal, unique: true
  end
end
