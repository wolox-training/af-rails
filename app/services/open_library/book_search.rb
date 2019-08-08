module OpenLibrary
  class BookSearch < Base
    def self.execute(isbn_number)
      isbn = "ISBN:#{isbn_number}"
      response = get('/api/books', query: { bibkeys: isbn }).parsed_response[isbn]
      if response.nil?
        "El libro no existe"
      else
        {
          isbn: isbn_number,
          title: response['title'],
          subtitle: response['subtitle'],
          number_of_pages: response['number_of_pages'],
          authors: response['authors']
        }
      end
    end
  end
end
