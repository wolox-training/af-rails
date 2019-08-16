require 'rails_helper'

describe PlaceOrder do
  describe '.call' do
    context 'When creating a vaild suggestion book' do
      before do
        @user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                             email: Faker::Internet.email, password: Faker::Internet.password,
                             locale: I18n.available_locales.sample,
                             confirmed_at: Time.zone.now, admin: true)
        @book = Book.create!(gender: Faker::Book.genre, author: Faker::Book.author,
                             image: Faker::Internet.url, title: Faker::Book.title.truncate(25),
                             editor: Faker::Book.publisher, year: Faker::Date.forward(23))
        @params = {
          user_id: @user.id,
          book_id: @book.id,
          start_date: (@start_date_rent = Faker::Date.forward(23)),
          end_date: (@end_date_rent = Faker::Date.forward(23))
        }
        @interactor = PlaceOrder.call(rent: @params)
      end

      it 'the method .call is success' do
        expect(@interactor).to be_a_success
      end
    end

    context 'When creating a invaild suggestion book' do
      before do
        @params = {
          user_id: nil,
          book_id: nil,
          start_date: nil,
          end_date: nil
        }
        @interactor = PlaceOrder.call(rent: @params)
      end

      it 'the method .call is failure' do
        expect(@interactor).to be_a_failure
      end
    end
  end
end
