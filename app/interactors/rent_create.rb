class RentCreate < ApiController
  include Interactor
  def call
    @rent = Rent.new(context.rent)
    #authorize @rent
    if @rent.save
      render json: context.result, status: :created
      context.result = @rent
    else
      render json: context.result.errors, status: :unprocessable_entity
      context.fail!
    end
  end
end
