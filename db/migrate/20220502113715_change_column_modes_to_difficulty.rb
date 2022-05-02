class ChangeColumnModesToDifficulty < ActiveRecord::Migration[6.1]
  def change
    change_column :modes, :difficulty, :string, null: false
  end
end
