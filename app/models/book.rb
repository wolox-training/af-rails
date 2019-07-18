class Book < ApplicationRecord
  has_one :rent, dependent: :destroy
  validates :gender, :author, :image, :title, :editor, :year, presence: true
end
