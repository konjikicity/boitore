class ChangeColumnsAddlimtlOnModes < ActiveRecord::Migration[6.1]
  def change
    change_column :modes, :difficulty, :string, null: false, limit: 10
    change_column :modes, :description, :string, null: false, limit: 30
  end
end
