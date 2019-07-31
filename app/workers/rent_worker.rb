class RentWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    rent = Rent.last
    RentMailer.creation_rent(rent).deliver#_later
  end
end
