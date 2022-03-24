class ChangeColumnModes < ActiveRecord::Migration[6.1]
  def change
    change_column :modes, :difficulty, :string
  end
end
