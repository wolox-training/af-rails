class RentMailForCreation < ApiController
  include Interactor
  def call
    byebug
    if context.success?
      render json: context.rent, status: :created
      RentMailer.new_rent(context.rent.id).deliver_later
    else
      render json: context.rent.errors, status: :unprocessable_entity
    end
  end
end
