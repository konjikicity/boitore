class AddIndexSentencesToBoin < ActiveRecord::Migration[6.1]
  def change
    add_index :sentences, :boin, unique: true
  end
end
