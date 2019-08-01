module Api
  module V1
    class SuggestionBookController < ApiController
      include Wor::Paginate

      def create
        @suggestion_book = SuggestionBook.new(suggestion_book_params)
        if @suggestion_book.save
          render json: @suggestion_book, status: :created
        else
          render json: @suggestion_book.errors, status: :unprocessable_entity
        end
      end

      private

      def suggestion_book_params
        params.permit(:user_id, :synopsis, :price, :author, :title, :link, :editor, :year)
      end
    end
  end
end
