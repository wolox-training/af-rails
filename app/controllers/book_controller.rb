class BookController < ApiController
  include Wor::Paginate

  def index
    render_paginated Book, each_serializer: BookSerializer
  end

  def show
    render_paginated Book, each_serializer: BookSerializer
  end
end
