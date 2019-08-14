module Api
  module V1
    class RentController < ApiController
      include Wor::Paginate
      before_action :authenticate_user!

      def index
        render_paginated policy_scope(Rent), each_serializer: RentSerializer
      end

      def create
        PlaceOrder.call(rent: rent_params.merge(user_id: current_user.id))
      end

      private

      def rent_params
        params.permit(:book_id, :start_date, :end_date)
      end
    end
  end
end
