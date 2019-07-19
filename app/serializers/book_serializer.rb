class BookSerializer < ActiveModel::Serializer
  attribute :id
  attribute :gender
  attribute :author
  attribute :image
  attribute :title
  attribute :editor
  attribute :year
end
