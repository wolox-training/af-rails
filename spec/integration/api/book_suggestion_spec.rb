require 'swagger_helper'

describe 'Books Suggestion Controllers', type: :request, swagger_doc: 'api/swagger_doc.json' do
  TAGS_BOOK_SUGGESTION = BookSuggestion
  path '/api/v1/book_suggestion' do
    post 'Create book suggestion' do
      tags TAGS_BOOK_SUGGESTION
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :string },
          synopsis: { type: :string },
          price: { type: :string },
          author: { type: :string },
          title: { type: :string },
          link: { type: :string },
          editor: { type: :string },
          year: { type: :string },
          description: 'This is component of book suggestion'
        }, requerid: %w[user_id synopsis price author title link editor year]
      }
      produces 'application/json'

      response '201', 'Book Suggestion created' do
        let(:user_id) { build(:user).id }
        let(:synopsis) { Faker::Internet.url('todosloslibros.com', '/synopsis') }
        let(:price) { Faker::Number.decimal(2).to_f }
        let(:author) { Faker::Book.author }
        let(:title) { Faker::Book.title }
        let(:link) { Faker::Internet.url('todosloslibros.com') }
        let(:editor) { Faker::Book.publisher }
        let(:year) { Faker::Date.forward(23) }
        let(:params) do
          { user_id: user_id, synopsis: synopsis, price: price, author: author, title: title,
            link: link, editor: editor, year: year }
        end
        include_context 'with integration test'
      end

      response '422', 'Book Suggestion dont create, argument nil' do
        let(:user_id) { build(:user).id }
        let(:synopsis) { Faker::Internet.url('todosloslibros.com', '/synopsis') }
        let(:price) { Faker::Number.decimal(2).to_f }
        let(:title) { Faker::Book.title }
        let(:link) { Faker::Internet.url('todosloslibros.com') }
        let(:editor) { Faker::Book.publisher }
        let(:year) { Faker::Date.forward(23) }
        let(:params) do
          { user_id: user_id, synopsis: synopsis, price: price, author: nil, title: title,
            link: link, editor: editor, year: year }
        end
        include_context 'with integration test'
      end
    end
  end
end
