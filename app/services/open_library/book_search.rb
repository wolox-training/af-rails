module OpenLibrary
  class BookSearch < Base
    def self.execute(isbn_number)
      isbn = "ISBN:#{isbn_number}"
      response = get('/api/books', query: { bibkeys: isbn }).parsed_response[isbn]
      if response.nil?
        raise Errors::OpenLibrary::BookNotFound.new,
          I18n.t('services.open_library.errors.book_not_found', isbn_number: isbn_number)
      end
      create_hash(isbn_number, response['title'], response['subtitle'],
                  response['number_of_pages'], response['authors'])
    end

    def create_hash(isbn_number, title, subtitle, number_of_pages, authors)
      {
        isbn: isbn_number,
        title: title,
        subtitle: subtitle,
        number_of_pages: number_of_pages,
        authors: authors
      }
    end
  end
end
