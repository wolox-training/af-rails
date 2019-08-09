require 'httparty'

module OpenLibrary
  class Base
    include HTTParty
    base_uri 'https://openlibrary.org'
    default_params format: 'json', jscmd: 'data'
  end
end
