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
        include_context 'with success authentication user'
        include_context 'with integration test'
      end

      response '401', 'Books not found, user dont logged in' do
        include_context 'with failure authentication user'
        include_context 'with integration test'
      end
    end
  end

  path '/api/v1/book/{id}' do
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
        include_context 'with success authentication user'
        include_context 'with integration test'
      end

      response '401', 'Books not found, user dont logged in' do
        let('id') { build(:book).id }
        include_context 'with failure authentication user'
        include_context 'with integration test'
      end
    end
  end
end
