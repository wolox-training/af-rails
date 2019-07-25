module Api
  module V1
    class RentController < ApiController
      include Wor::Paginate
  
      #before_action :authenticate_user!
        
      @new_user

      def index
        render_paginated Rent, each_serializer: RentSerializer
      end
  
      def create
        @rent = Rent.new(rent_params)
        if @rent.save
          render json: @rent, status: :created
        else
          render json: @rent.errors, status: :unprocessable_entity
        end
      end
  
      private
        def rent_params
          params.require(:user_id, :book_id, :start_date, :end_date)
        end
    end
  end
end
  