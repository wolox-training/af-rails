FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    locale { I18n.available_locales.sample }
    confirmed_at { Time.zone.now }
  end
end
