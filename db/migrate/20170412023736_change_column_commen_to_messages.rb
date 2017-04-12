class ChangeColumnCommenToMessages < ActiveRecord::Migration[5.0]
  def up
    change_column :messages, :comment, :text, null: true
  end

  def down
    change_column :messages, :comment, :text
  end
end
