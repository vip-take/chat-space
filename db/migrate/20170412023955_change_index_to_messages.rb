class ChangeIndexToMessages < ActiveRecord::Migration[5.0]

  def change
    add_index :messages, [:group_id, :created_at]
  end
end
