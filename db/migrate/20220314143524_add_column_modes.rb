class AddColumnModes < ActiveRecord::Migration[6.1]
  def change
    add_column :modes, :description, :string
  end
end
