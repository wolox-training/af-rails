module Api
  module V1
    class BookSuggestionController < ApiController
      include Wor::Paginate

      def create
        @book_suggestion = BookSuggestion.new(book_suggestion_params)
        if @book_suggestion.save
          render json: @book_suggestion, status: :created
        else
          render json: @book_suggestion.errors, status: :unprocessable_entity
        end
      end

      private

      def book_suggestion_params
        params.permit(:user_id, :synopsis, :price, :author, :title, :link, :editor, :year)
      end
    end
  end
end
