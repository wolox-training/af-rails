require 'rails_helper'

describe Api::V1::RentController do
  subject(:context) do
    
  end

  include_context 'Authenticated User'
  describe '.call' do
    context 'when create valid rent' do
      before do
        user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email,
        password: Faker::Internet.password, locale: I18n.available_locales.sample, confirmed_at: Time.zone.now, admin: true)
        book = Book.create!(gender: Faker::Book.genre, author: Faker::Book.author,
        image: Faker::Internet.url, title: Faker::Book.title.truncate(25),
        editor: Faker::Book.publisher, year: Faker::Date.forward(23))
        new_rent = { user_id: user.id, book_id: book.id, start_date: Faker::Date.forward(23),
        end_date: Faker::Date.forward(23) }
      end

      it 'succeeds' do
        post :create, params: { rent: new_rent }
        
        expect(context).to be_a_success
      end

      it 'provides the user' do
        expect(context.user).to eq(user)
      end

      it "provides the user's secret token" do
        expect(context.token).to eq('token')
      end
    end
  end
end
