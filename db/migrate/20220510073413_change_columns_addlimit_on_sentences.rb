class ChangeColumnsAddlimitOnSentences < ActiveRecord::Migration[6.1]
  def change
    change_column :sentences, :normal, :string, null: false, limit: 20
    change_column :sentences, :boin, :string, null: false, limit: 20
  end
end
