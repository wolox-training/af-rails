FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
<<<<<<< HEAD
    password { Faker::Internet.password }
=======
    password { Faker::Internet.passwor }
>>>>>>> ced405fc982e7eb8894c6a80653b616a490edb68
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
