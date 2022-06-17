class ChangeColumnUsersToNickname < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :nickname, :string, limit: 50
  end
end
