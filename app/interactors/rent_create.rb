class RentCreate < ApiController
  include Interactor
  def call
    @rent = Rent.new(context.rent)
    #authorize @rent
    if @rent.save
      context.result = @rent
    else
      context.fail!
    end
  end
end
