require 'rails_helper'

describe RentCreate do
  describe '.call' do
    context 'When creating a vaild suggestion book' do
      let(:book) { create(:book) }
      let(:user) { create(:user) }
      let(:new_rent) { attributes_for(:rent).merge(book_id: book.id, user_id: user.id) }
      let(:interactor) { PlaceOrder.call(rent: new_rent) }

      it 'the method .call is success' do
        expect(interactor).to be_a_success
      end

      it 'rent user id is success' do
        expect(interactor.rent[:user_id]).to eq(user.id)
      end

      it 'rent book id is success' do
        expect(interactor.rent[:book_id]).to eq(book.id)
      end

      it 'rent start_date is success' do
        expect(interactor.rent[:start_date]).to eq(new_rent[:start_date])
      end

      it 'rent end_date is success' do
        expect(interactor.rent[:end_date]).to eq(new_rent[:end_date])
      end
    end

    context 'When creating a invaild suggestion book' do
      let(:new_rent) { attributes_for(:rent).merge(book_id: nil, user_id: create(:user).id) }
      let(:interactor) { PlaceOrder.call(rent: new_rent) }


      it 'the method .call is failure' do
        expect(interactor).to be_a_failure
      end

      it 'the method .call is failure, and present a message' do
        expect(interactor.message).to be_present
      end
    end
  end
end
