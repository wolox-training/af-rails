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
        let(:token) { create(:user).create_new_auth_token }
        let('HTTP_ACCESS_TOKEN') { token['access-token'] }
        let('HTTP_TOKEN_TYPE') { token['token-type'] }
        let('HTTP_CLIENT') { token['client'] }
        let('HTTP_EXPIRY') { token['expiry'] }
        let('HTTP_UID') { token['uid'] }
        include_context 'with mocked open library'
        include_context 'with integration test'
      end

      response '404', 'Book not found' do
        let(:token) { create(:user).create_new_auth_token }
        let('HTTP_ACCESS_TOKEN') { token['access-token'] }
        let('HTTP_TOKEN_TYPE') { token['token-type'] }
        let('HTTP_CLIENT') { token['client'] }
        let('HTTP_EXPIRY') { token['expiry'] }
        let('HTTP_UID') { token['uid'] }
        let('isbn') { '03854725797' }
        include_context 'with mocked open library'
        include_context 'with integration test'
      end
    end
  end
end
