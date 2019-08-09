require 'rails_helper'

describe OpenLibrary::BookSearch,
         type: :services do
  describe '.excecute' do
    context 'when the ISBN book existsts' do
      before do
        book_request_success
      end

      let(:result) do
        OpenLibrary::BookSearch.execute('0385472579')
      end

      it 'returns the book title' do
        expect(result[:title]).to eq 'Zen speaks'
      end

      it 'returns the book subtitle' do
        expect(result[:subtitle]).to eq 'shouts of nothingness'
      end

      it 'returns the book isbn' do
        expect(result[:isbn]).to eq '0385472579'
      end

      it 'returns the book number_of_pages' do
        expect(result[:number_of_pages]).to eq 159
      end

      it 'returns the book authors' do
        expect(result[:authors]).to eq [
          {
            url: 'https://openlibrary.org/authors/OL223368A/Zhizhong_Cai',
            name: 'Zhizhong Cai'
          }
        ].as_json
      end
    end

    context 'when the ISBN book dont existsts' do
      before do
        book_request_not_found
      end

      let(:result) do
        OpenLibrary::BookSearch.execute('03854725799')
      end

      it 'responds with 404 status' do
        expect { result }.to raise_error(Errors::OpenLibrary::BookNotFound)
      end
    end
  end
end
