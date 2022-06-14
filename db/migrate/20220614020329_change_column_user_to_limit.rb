class ChangeColumnUserToLimit < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :name, :string, null: false, limit: 50
  end
end
