FactoryBot.define do
  factory :rent do
    user
    book
    start_date { Faker::Date.forward(23) }
    end_date { Faker::Date.forward(23) }
  end
end
