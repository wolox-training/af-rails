module OpenLibrary
  class BookSearch < Base
    def self.execute(number_isbn)
      isbn = "ISBN:#{number_isbn}"
      response = get('/api/books', query: { bibkeys: isbn })
      @my_book = {
        'ISBN' => number_isbn,
        'TITLE' => response.parsed_response[isbn]['name'],
        'SUBTITLE' => response.parsed_response[isbn]['subtitle'],
        'NUMBER_OF_PAGES' => response.parsed_response[isbn]['number_of_pages'],
        'AUTHORS' => response.parsed_response[isbn]['authors']
      }
    end
  end
end
