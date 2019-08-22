require 'swagger_helper'

describe 'Books controllers', type: :request, swagger_doc: 'api/swagger_doc.json' do
  TAGS_BOOK = Book
  path '/api/v1/book' do
    get 'Retrieves all book.' do
      tags TAGS_BOOK
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

      response '200', 'Books found' do
        let(:token) { create(:user).create_new_auth_token }
        let('HTTP_ACCESS_TOKEN') { token['access-token'] }
        let('HTTP_TOKEN_TYPE') { token['token-type'] }
        let('HTTP_CLIENT') { token['client'] }
        let('HTTP_EXPIRY') { token['expiry'] }
        let('HTTP_UID') { token['uid'] }
        include_context 'with integration test'
      end

      response '401', 'Books not found, user dont logged in' do
        let(:token) { build(:user).create_new_auth_token }
        let('HTTP_ACCESS_TOKEN') { 'tokent dont exist' }
        let('HTTP_TOKEN_TYPE') { token['token-type'] }
        let('HTTP_CLIENT') { token['client'] }
        let('HTTP_EXPIRY') { token['expiry'] }
        let('HTTP_UID') { token['uid'] }
        include_context 'with integration test'
      end
    end

    get 'Retrieves a book.' do
      tags TAGS_BOOK
      parameter name: 'id', in: :path, required: true, type: :string,
                description: 'This is the id of book'
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
        let('id') { create(:book).id }
        let(:token) { create(:user).create_new_auth_token }
        let('HTTP_ACCESS_TOKEN') { token['access-token'] }
        let('HTTP_TOKEN_TYPE') { token['token-type'] }
        let('HTTP_CLIENT') { token['client'] }
        let('HTTP_EXPIRY') { token['expiry'] }
        let('HTTP_UID') { token['uid'] }
        include_context 'with integration test'
      end

      response '200', 'Book not found, book dont exist' do
        let('id') { build(:book).id }
        let(:token) { create(:user).create_new_auth_token }
        let('HTTP_ACCESS_TOKEN') { token['access-token'] }
        let('HTTP_TOKEN_TYPE') { token['token-type'] }
        let('HTTP_CLIENT') { token['client'] }
        let('HTTP_EXPIRY') { token['expiry'] }
        let('HTTP_UID') { token['uid'] }
        include_context 'with integration test'
      end

      response '401', 'Books not found, user dont logged in' do
        let('id') { build(:book).id }
        let(:token) { create(:user).create_new_auth_token }
        let('HTTP_ACCESS_TOKEN') { 'tokent dont exist' }
        let('HTTP_TOKEN_TYPE') { token['token-type'] }
        let('HTTP_CLIENT') { token['client'] }
        let('HTTP_EXPIRY') { token['expiry'] }
        let('HTTP_UID') { token['uid'] }
        include_context 'with integration test'
      end
    end
  end
end
