require 'rails_helper'

describe Api::V1::BookSuggestionController,
         type: :controller do

  describe 'POST #create' do
    context 'When creating a vaild suggestion book' do
      subject(:http_request) { post :create, params: { book_suggestion: new_book_suggestion } }
      let(:new_book_suggestion) { attributes_for(:book_suggestion) }

      it 'creates a new suggestion book' do
        post :create, params: { book_suggestion: new_book_suggestion }
        expect { http_request }.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestion: new_book_suggestion }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid suggestion book' do
      subject(:http_request) { post :create, params: { book_suggestion: new_book_suggestion } }
      let(:new_book_suggestion) { attributes_for(:book_suggestion) }

      before do
        new_book_suggestion[:author] = nil
      end

      it 'doesn\'t create a new rent' do
        expect do
          post :create, params: { book_suggestion: new_book_suggestion }
        end.to change { BookSuggestion.count }.by(0)
      end

      it 'returns error messages' do
        post :create, params: { book_suggestion: new_book_suggestion }
        expect(response.success?) == false
      end

      it 'responds with 422 status' do
        post :create, params: { book_suggestion: new_book_suggestion }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
