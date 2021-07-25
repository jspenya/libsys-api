class Student < ApplicationRecord
  has_many :borrowed_books
  has_many :books, :through => :borrowed_books
end
