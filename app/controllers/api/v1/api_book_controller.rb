module Api
  module V1
    class ApiBookController < ApiController
      include Wor::Paginate
      require 'open_library'

      def show
        byebug
        OpenLibrary.search_book(show_params)

      end
  
      private

      def show_params
        params.require(:id)
      end
        
    end
  end
end
  