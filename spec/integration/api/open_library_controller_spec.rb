require 'swagger_helper'

describe 'Open Library Controllers', type: :request, swagger_doc: 'api/swagger_doc.json' do
  TAGS_OPEN_LIBRARY = OpenLibrary
  path '/api/v1/open_library/{isbn}' do
    get 'Find a book' do
      tags TAGS_OPEN_LIBRARY
      parameter name: 'isbn', in: :path, required: true, type: :string,
                description: 'This is isbn book'
      parameter name: 'HTTP_ACCESS_TOKEN', in: :header, required: true, type: :string,
                description: 'This field is requerid for any request'
      parameter name: 'HTTP_TOKEN_TYPE', in: :header, required: true, type: :string,
                description: 'This field is requerid for any request'
      parameter name: 'HTTP_CLIENT', in: :header, required: true, type: :string,
                description: 'This field is requerid for any request'
      parameter name: 'HTTP_EXPIRY', in: :header, required: true, type: :string,
                description: 'This field is requerid for any request'
      parameter name: 'HTTP_UID', in: :header, required: true, type: :string,
                description: 'This field is requerid for any request'
      produces 'application/json'

      response '200', 'Book found' do
        let('isbn') { '0385472579' }
        include_context 'with success authentication user'
        include_context 'with mocked open library'
        include_context 'with integration test'
      end

      response '404', 'Book not found' do
        let('isbn') { '03854725797' }
        include_context 'with success authentication user'
        include_context 'with mocked open library'
        include_context 'with integration test'
      end
    end
  end
end
