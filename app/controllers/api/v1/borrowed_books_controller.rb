module Api
  module V1
    class BorrowedBooksController < ApplicationController
      # GET /borrowed_books
      def index
        @borrowed_books = BorrowedBook.all

        render json: @borrowed_books
      end

      # GET /borrowed_books/1
      def show
        render json: @borrowed_book
      end

      # POST /borrowed_books
      def create
        @borrowed_book = BorrowedBook.new(borrowed_book_params)
        @borrowed_book.book.update(is_available: false)

        if @borrowed_book.save
          render json: @borrowed_book, status: :created
        else
          Rails.logger.info("NOT SAVED")
          render json: @borrowed_book.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /borrowed_books/1
      def update
        @borrowed_book = BorrowedBook.find(params[:id])
        if @borrowed_book.update(borrowed_book_params)
          render json: @borrowed_book
        else
          render json: @borrowed_book.errors, status: :unprocessable_entity
        end
      end

      # DELETE /borrowed_books/1
      def destroy
        BorrowedBook.destroy(params[:id])
      end

      def return_book
        @borrowed_book = BorrowedBook.find(params[:id])

        if @borrowed_book.update(return_date: DateTime.now)
          @borrowed_book.book.update(is_available: true)
          Rails.logger.info("RETURNED BOOK!!")
          render json: @borrowed_book
        else
          render json: @borrowed_book.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
      def set_borrowed_book
        @borrowed_book = BorrowedBook.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def borrowed_book_params
        params.require(:borrowed_book).permit(:student_id, :book_id)
      end
    end
  end
end
