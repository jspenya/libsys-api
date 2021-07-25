class RemoveAuthorAndUserIdFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :author_id
    remove_column :books, :user_id
  end
end
