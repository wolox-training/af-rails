require 'rails_helper'

describe PlaceOrder do
  describe '.call' do
    context 'When creating a vaild suggestion book' do
      let(:book) { create(:book) }
      let(:user) { create(:user) }
      let(:new_rent) { attributes_for(:rent).merge(book_id: book.id, user_id: user.id) }
      let(:interactor) { PlaceOrder.call(rent: new_rent) }

      it 'the method .call is success' do
        expect(interactor).to be_a_success
      end
    end

    context 'When creating a invalid suggestion book' do
      let(:new_rent) { attributes_for(:rent).merge(book_id: nil, user_id: create(:user).id) }
      let(:interactor) { PlaceOrder.call(rent: new_rent) }

      it 'the method .call is failure' do
        expect(interactor).to be_a_failure
      end
    end
  end
end
