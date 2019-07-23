require 'rails_helper'

describe Api::V1::BookController,
         type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the books' do
      let!(:books) { create_list(:book, 3) }

      before do
        get :index
      end

      it 'responses with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(JSON.parse(response.body)) =~ expected
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      let!(:books) { create_list(:book, 3) }

      before do
        get :show, params: { id: books.first.id }
      end

      it 'responses with the book json' do
        expect(JSON.parse(response.body).to_json).to eq BookSerializer.new(
          books.first, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
