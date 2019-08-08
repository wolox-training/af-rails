require 'rails_helper'

describe Api::V1::OpenLibraryController, type: :controller do
  describe 'GET #show' do
    context 'When fetching a books on external api' do
      before do
        WebMock.disable!
        get :show, params: { id: '0385472579' }
      end

      it 'responses with the book json' do
        expected = File.read('./spec/support/fixtures/mocked_book_after_response.json')
        expect(JSON.parse(response.body)) =~ expected
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
