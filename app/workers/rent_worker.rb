class RentWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    rent = Rent.last
    RentMailer.creation_rent(rent).deliver_later
  end
end
