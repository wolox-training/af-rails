FactoryBot.define do
  factory :book do
    gender { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::String.random }
    title { Faker::Book.title }
    editor { Faker::Book.publisher }
    year { Faker::Date.forward(23).to_s }
  end
end
