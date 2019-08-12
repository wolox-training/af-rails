FactoryBot.define do
  factory :book do
    gender { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::Internet.url }
    title { Faker::Book.title.truncate(25) }
    editor { Faker::Book.publisher }
    year { Faker::Date.forward(23) }
  end
end
