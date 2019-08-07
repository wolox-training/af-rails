FactoryBot.define do
  factory :book_suggestion do
    synopsis { Faker::Internet.url('todosloslibros.com', '/synopsis') }
    price { Faker::Number.decimal(2).to_f }
    author { Faker::Book.author }
    title { Faker::Book.title }
    link { Faker::Internet.url('todosloslibros.com') }
    editor { Faker::Book.publisher }
    year { Faker::Date.forward(23) }
    user
  end
end
