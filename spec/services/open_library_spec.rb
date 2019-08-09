require 'rails_helper'

describe OpenLibrary::BookSearch,
         type: :services do

  it 'makes an external request' do
    book_request_success
    expect(OpenLibrary::BookSearch.execute('0385472579')['title'] == 'Zen speaks')
      .target == true
  end
end
