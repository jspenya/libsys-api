class Book < ApplicationRecord
  # belongs_to :user
  has_many :borrowed_books
  has_many :students, :through => :borrowed_books

  validates :title, presence: true

  scope :borrowed, ->{where( id: BorrowedBook.not_returned.pluck(:book_id))}
  
  scope :not_borrowed, ->{ Book.all.where.not(id: Book.borrowed)}
  
  scope :returned, ->{where( id: BorrowedBook.returned.pluck(:book_id))}
end
