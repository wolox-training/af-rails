class RentWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    rent = Rent.last
    I18n.locale = rent.user.locale
    RentMailer.creation_rent(rent).deliver_later
  end
end
