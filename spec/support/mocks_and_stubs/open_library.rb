def mocked_book_request_success
    byebug
    stub_request(:get, "https://openlibrary.org/api/books?bibkeys=ISBN:0385472579&format=json&jscmd=data")
      .to_return(
        status: code,
        body: File.read('./spec/support/fixtures/mocked_book_response_success.json'),
        headers: { 'Content-Type': 'application/json' }
      )
  end