class RentMailForCreation < ApiController
  include Interactor
  def call
    byebug
    RentMailer.new_rent(context.result.id).deliver_later if context.success?
  end
end
