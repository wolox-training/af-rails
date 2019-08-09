require 'sidekiq-scheduler'

class ExpiredRentScheduler
  include Sidekiq::Worker

  def perform
    Rent.where(end_date: Time.zone.today).each do |rent|
      ExpiredRent.expired_rent(rent.id)
    end
  end
end
