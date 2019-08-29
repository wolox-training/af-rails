require 'swagger_helper'

describe 'Rent controller', type: :request, swagger_doc: 'api/swagger_doc.json' do
  TAGS_RENT = Rent
  path '/api/v1/rent' do
    get 'Retrieves all rent. By User' do
      tags TAGS_RENT
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

      response '200', 'Rents found' do
        include_context 'with success authentication user'
        include_context 'with integration test'
      end

      response '401', 'User dont logged in' do
        include_context 'with failure authentication user'
        include_context 'with integration test'
      end
    end

    post 'Creation rent by user' do
      tags TAGS_RENT
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          book_id: { type: :string },
          start_date: { type: :string },
          end_date: { type: :string },
          description: 'This is component of rent'
        }, requerid: %w[book_id start_date end_date]
      }
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

      response '201', 'Rent create' do
        let(:book_id) { create(:book).id }
        let(:start_date) { Faker::Date.forward(23) }
        let(:end_date) { Faker::Date.forward(23) }
        let(:params) do
          { book_id: book_id, start_date: start_date, end_date: end_date }
        end
        include_context 'with success authentication user'
        include_context 'with integration test'
      end

      response '422', 'Rent unprocessable, book id dont exist' do
        let(:book_id) { build(:book).id }
        let(:start_date) { Faker::Date.forward(23) }
        let(:end_date) { Faker::Date.forward(23) }
        let(:params) do
          { book_id: book_id, start_date: start_date, end_date: end_date }
        end
        include_context 'with success authentication user'
        include_context 'with integration test'
      end

      response '401', 'Rent dont create, user dont logged in' do
        let(:book_id) { build(:book).id }
        let(:start_date) { Faker::Date.forward(23) }
        let(:end_date) { Faker::Date.forward(23) }
        let(:params) do
          { book_id: book_id, start_date: start_date, end_date: end_date }
        end
        include_context 'with failure authentication user'
        include_context 'with integration test'
      end
    end
  end
end
