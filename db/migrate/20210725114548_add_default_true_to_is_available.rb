class AddDefaultTrueToIsAvailable < ActiveRecord::Migration[6.1]
  def change
    change_column_default :books, :is_available, true
  end
end
