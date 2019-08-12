class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user, :book, :start_date, :end_date, presence: true

  scope :expired, -> { where(arel_table[:end_date].lt(Time.zone.today)) }
end
