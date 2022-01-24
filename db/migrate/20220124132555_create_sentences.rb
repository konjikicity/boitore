class CreateSentences < ActiveRecord::Migration[6.1]
  def change
    create_table :sentences do |t|
      t.string :boin, null: false 
      t.string :normal, null: false

      t.timestamps
    end
  end
end
