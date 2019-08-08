def mocked_book_request_success
  stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=ISBN:0385472579&format=json&jscmd=data')
    .with(
      headers: {
        'Accept' => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent' => 'Ruby'
      }
    )
    .to_return(
      status: code,
      body: File.read('./spec/support/fixtures/mocked_book_response_success.json'),
      headers: { 'Content-Type': 'application/json' }
    )
end
