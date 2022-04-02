class ChangeColumnModesToDescription < ActiveRecord::Migration[6.1]
  def change
    change_column :modes, :description, :string, null: false
  end
  add_index :modes, [:difficulty], unique: true
end
