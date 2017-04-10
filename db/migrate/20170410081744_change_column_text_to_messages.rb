class ChangeColumnTextToMessages < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :text, :image
  end
end
