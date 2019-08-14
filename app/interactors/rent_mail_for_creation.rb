class RentMailForCreation < InteractorBase
  def call
    RentMailer.new_rent(context.result.id).deliver_later
  end
end
