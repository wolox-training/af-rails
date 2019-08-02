require 'rails_helper'

describe Api::V1::SuggestionBookController,
         type: :controller do

  describe 'POST #create' do
    context 'When creating a vaild suggestion book' do
      let!(:new_suggestion_book) do
        # attributes_for(:suggestion_book, user_id: user.id) }
        # attributes_with_foreign_keys(:suggestion_book, user: user) }
        FactoryBot.create(:suggestion_book)
      end
      it 'creates a new suggestion book' do
        expect do
          post :create, params: { user_id: user.id, synopsis: new_suggestion_book.synopsis,
                                  price: new_suggestion_book.price,
                                  author: new_suggestion_book.author,
                                  title: new_suggestion_book.title,
                                  link: new_suggestion_book.link,
                                  editor: new_suggestion_book.editor,
                                  year: new_suggestion_book.year }
        end.to change { SuggestionBook.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { user_id: user.id, synopsis: new_suggestion_book.synopsis,
                                price: new_suggestion_book.price,
                                author: new_suggestion_book.author,
                                title: new_suggestion_book.title,
                                link: new_suggestion_book.link,
                                editor: new_suggestion_book.editor,
                                year: new_suggestion_book.year }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid suggestion book' do
      let!(:new_suggestion_book) do # attributes_with_foreign_keys(:suggestion_book, user: nil)
        FactoryBot.create(:suggestion_book)
      end
      before do
        post :create, params: { user_id: nil, synopsis: new_suggestion_book.synopsis,
                                price: new_suggestion_book.price,
                                author: new_suggestion_book.author,
                                title: new_suggestion_book.title,
                                link: new_suggestion_book.link,
                                editor: new_suggestion_book.editor,
                                year: new_suggestion_book.year }
      end

      it 'doesn\'t create a new rent' do
        expect do
          post :create, params: { user_id: nil, synopsis: new_suggestion_book.synopsis,
                                  price: new_suggestion_book.price,
                                  author: new_suggestion_book.author,
                                  title: new_suggestion_book.title,
                                  link: new_suggestion_book.link,
                                  editor: new_suggestion_book.editor,
                                  year: new_suggestion_book.year }
        end.to change { SuggestionBook.count }.by(0)
      end

      it 'returns error messages' do
        expect(response.body['error']).to be_present
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
