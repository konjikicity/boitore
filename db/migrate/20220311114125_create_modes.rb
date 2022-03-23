class CreateModes < ActiveRecord::Migration[6.1]
  def change
    create_table :modes do |t|
      t.integer :difficulty, null: false
      t.timestamps
    end
  end
end
