module Api
  module V1
    class RentController < ApiController
      include Wor::Paginate
      before_action :authenticate_user!

      def index
        render_paginated policy_scope(Rent), each_serializer: RentSerializer
      end

      def create
        result = PlaceOrder.call(rent: rent_params.merge(user_id: current_user.id))
        raise Errors::Rent::RentCreationFailed.new, result.message unless result.success?

        authorize result.result
        render json: result.result, status: :created
      end

      private

      def rent_params
        params.permit(:book_id, :start_date, :end_date)
      end
    end
  end
end
