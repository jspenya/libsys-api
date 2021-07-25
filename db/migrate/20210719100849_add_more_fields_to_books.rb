class AddMoreFieldsToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :description, :text
    add_column :books, :author, :string
    add_column :books, :isbn, :string
    add_column :books, :publisher, :string
    add_column :books, :is_available, :boolean
  end
end
