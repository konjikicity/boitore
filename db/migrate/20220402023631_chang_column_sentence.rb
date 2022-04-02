class ChangColumnSentence < ActiveRecord::Migration[6.1]
  def change
    add_index :sentences, [:boin, :normal], unique: true
  end
end
