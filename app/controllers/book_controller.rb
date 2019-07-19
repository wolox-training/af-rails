class BookController < ApiController
  include Wor::Paginate
  
  def index
    render_paginated Book, each_serializer: BookSerializer
  end

  def show
    id = show_params
    if (id.to_i.!= 0)
      render json: Book.find(id), status: :ok
    else
      render json: "Eror en tipo de Id"
    end
  end

  private

  def show_params
    params.require(:id)
  end
end
