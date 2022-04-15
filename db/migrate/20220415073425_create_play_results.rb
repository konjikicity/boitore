class CreatePlayResults < ActiveRecord::Migration[6.1]
  def change
    create_table :play_results do |t|
      t.string :practiced_normal, null: false
      t.string :practiced_boin, null: false
      t.string :normal_voice, null: false
      t.string :boin_voice, null: false
      t.string :judge, null: false
      t.integer :score, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
