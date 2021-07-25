class BorrowedBook < ApplicationRecord
  belongs_to :student
  belongs_to :book

  scope :not_returned, ->{ where( id: where(return_date:nil))}
  scope :returned, ->{ where( id: where.not(return_date:nil))}

  scope :overdue, -> { not_returned.where( "due_date < ?", Date.today ) }
end
