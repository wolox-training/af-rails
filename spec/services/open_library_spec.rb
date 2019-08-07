require 'rails_helper'

describe OpenLibrary::BookSearch,
         type: :services do

    it 'makes an external request' do
        OpenLibrary::BookSearch.execute("0385472579")

    end
end