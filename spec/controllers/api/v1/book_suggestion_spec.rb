require 'rails_helper'

describe Api::V1::BookSuggestionController,
         type: :controller do

  describe 'POST #create' do
    context 'When creating a vaild suggestion book' do
      subject(:http_request) { post :create, params: { book_suggestion: new_book_suggestion } }
      let(:new_book_suggestion) { attributes_for(:book_suggestion) }

      it 'creates a new suggestion book' do
        expect { http_request }.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with created status' do
        http_request
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid suggestion book' do
      subject(:http_request) { post :create, params: { book_suggestion: new_book_suggestion } }
      let(:new_book_suggestion) { attributes_for(:book_suggestion, title: nil) }

      it 'doesn\'t create a new rent' do
        expect { http_request }.not_to change(BookSuggestion, :count)
      end

      it 'returns error messages' do
        http_request
        expect(JSON.parse(response.body)['errors']).to be_present
      end

      it 'responds with unprocessable_entity status' do
        http_request
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
