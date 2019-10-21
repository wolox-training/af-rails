module Api
  module V1
    class BookController < ApiController
      include Wor::Paginate

      before_action :authenticate_user!

      def index
        render_paginated Book, each_serializer: BookSerializer
      end

      def show
        render json: Book.find(show_params), status: :ok
      end

      def create
        result = BookCreate.call(book: book_params)
        if result.success?
          render json: result.result, status: :created
        else
          book_not_created(result.message)
        end
      end

      private

      def show_params
        params.require(:id)
      end

      def book_params
        params.permit(:gender, :author, :image, :title, :editor, :year)
      end

      def book_not_created(exception)
        render json: { errors: exception }, status: :unprocessable_entity
      end
    end
  end
end
