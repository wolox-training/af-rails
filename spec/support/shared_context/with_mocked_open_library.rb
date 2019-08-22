require 'rails_helper'

shared_context 'with mocked open library' do
  before do
    book_request_success
  end
end
