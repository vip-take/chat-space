class ChangeColumnUserGroupToGroupUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :group_users, :group_id, :integer, null: true, foreign_key: true
    change_column :group_users, :user_id, :integer, null: true, foreign_key: true
  end

  def down
    change_column :group_users, :group_id, :integer, null: false, foreign_key: true
    change_column :group_users, :user_id, :integer, null: false, foreign_key: true
  end
end
