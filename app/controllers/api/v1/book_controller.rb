module Api
  module V1
    class BookController < ApiController
      include Wor::Paginate

      #before_action :authenticate_user!

      def index
        render_paginated Book, each_serializer: BookSerializer
      end

      def show
        render json: Book.find(show_params), status: :ok
      end

      private

      def show_params
        params.require(:id)
      end
    end
  end
end
