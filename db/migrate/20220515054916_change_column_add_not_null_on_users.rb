class ChangeColumnAddNotNullOnUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :name, :string, null: false, limit: 10
    change_column :users, :email, :string, null: false
  end
end
