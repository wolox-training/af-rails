require 'swagger_helper'

describe 'WBooks API', type: :request, swagger_doc: 'api/swagger_doc.json' do
  TAGS_RENT = Rent
  path '/api/v1/rent' do
    get 'Retrieves all rent. By User' do
      tags TAGS_RENT
      produces 'application/json'
      response '401', 'Rents found' do
        before { create_list(:rent, 2) }

        include_context 'with integration test'
        include_context 'Authenticated User'
      end
    end
  end
end
