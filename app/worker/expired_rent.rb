require 'sidekiq-scheduler'

class ExpiredRent
  include Sidekiq::Worker

  def perform
    Rent.where(end_date: Date.today).each do |rent|
      ExpiredRent.expired_rent(rent.id)
    end
  end
end