module MockHelper
  def book_request_success
    stub_request(:get, /books/)
      .to_return(
        status: 200,
        body: File.read('./spec/support/fixtures/mocked_book_response_success.json'),
        headers: { 'Content-Type': 'application/json' }
      )
  end
end
