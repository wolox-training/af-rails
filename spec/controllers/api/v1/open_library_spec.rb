require 'rails_helper'

describe Api::V1::OpenLibraryController, type: :controller do
  include_context 'Authenticated User'
  describe 'GET #show' do
    context 'When fetching a books on external api' do
      before do
        book_request_success
        get :show, params: { id: '0385472579' }
      end

      it 'response with a book hash' do
        expect(JSON.parse(response.body)).to match_array %w[isbn title subtitle number_of_pages authors ]
      end

      it 'returns the book title' do
        expect(JSON.parse(response.body)['title']).to eq('Zen speaks')
      end

      it 'returns the book isbn' do
        expect(JSON.parse(response.body)['isbn']).to eq('0385472579')
      end

      it 'returns the book subtitle' do
        expect(JSON.parse(response.body)['subtitle']).to eq('shouts of nothingness')
      end

      it 'returns the book number_of_pages' do
        expect(JSON.parse(response.body)['number_of_pages']) == 159
      end

      it 'returns the book authors' do
        expect(JSON.parse(response.body)['authors']).to eq([
          {
            url: 'https://openlibrary.org/authors/OL223368A/Zhizhong_Cai',
            name: 'Zhizhong Cai'
          }
        ].as_json)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
