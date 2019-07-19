describe 'GET #index' do
    context 'When fetching all the users rents' do
      let!(:rents) { create_list(:rent, 3, user: user) }

      before do
        get :index, params: { id: user.id }
      end

      it 'responses with the users rents json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          rents, each_serializer: RentSerializer
        ).to_json
        expect(response_body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'when a book is show' do
      let!(:book) { FactoryBot.create(:book) }

      before do
        get :show, params: { book_id: book.id }
      end

      it 'responses with the book rent json' do
        expect(response_body.to_json).to eq RentSerializer.new(
          rent, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end