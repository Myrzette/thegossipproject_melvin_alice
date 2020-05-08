class AddContentToPrivateMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :private_messages, :content, :text
  end
end
