module OpenLibrary
  class BookSearch < Base
    def self.execute(number_isbn)
      isbn = "ISBN:#{number_isbn}"
      response = get('/api/books', query: { bibkeys: isbn })
      @my_book = {
        isbn: number_isbn,
        title: response.parsed_response[isbn]['name'],
        subtitle: response.parsed_response[isbn]['subtitle'],
        number_of_pages: response.parsed_response[isbn]['number_of_pages'],
        authors: response.parsed_response[isbn]['authors']
      }
    end
  end
end
