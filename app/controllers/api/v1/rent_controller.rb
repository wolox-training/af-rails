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
        if result.success?
          authorize result.result
          render json: result.result, status: :created
        else
          book_not_exist(result.message)
        end
      end

      private

      def rent_params
        params.permit(:book_id, :start_date, :end_date)
      end

      def book_not_exist(exception)
        render json: { errors: exception }, status: :unprocessable_entity
      end
    end
  end
end
