require 'sidekiq-scheduler'

class ExpiredRentScheduler
  include Sidekiq::Worker

  def perform
    Rent.expired.each do |rent|
      RentMailer.expired_rent(rent.id).deliver_later
    end
  end
end
