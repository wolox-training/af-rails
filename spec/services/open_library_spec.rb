require 'rails_helper'

describe OpenLibrary::BookSearch,
         type: :services do

  it 'makes an external request' do
    expect(OpenLibrary::BookSearch.execute('0385472579')['TITLE'] == 'Zen speaks')
      .target == true
  end
end
