class AddReturnDateAndDueDateToBorrowedBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :borrowed_books, :return_date, :datetime
    add_column :borrowed_books, :due_date, :datetime
  end
end
