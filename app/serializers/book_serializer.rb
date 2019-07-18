class BookSerializer < ActiveModel::Serializer
  attributes :id, :gender, :author, :image, :title, :editor, :year

  def links
    { self: book_path(object.id) }
  end
end
