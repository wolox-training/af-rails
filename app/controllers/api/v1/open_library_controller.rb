module Api
  module V1
    class OpenLibraryController < ApiController
      include Wor::Paginate

      before_action :authenticate_user!

      def show
        render json: OpenLibrary::BookSearch.execute(show_params), status: :ok
      end

      private

      def show_params
        params.require(:id)
      end
    end
  end
end
