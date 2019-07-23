class Book < ApplicationRecord
  has_many :rent, dependent: :destroy
  validates :gender, :author, :image, :title, :editor, :year, presence: true
end
