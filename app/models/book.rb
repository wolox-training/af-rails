class Book < ApplicationRecord
  has_many :rent, dependent: :destroy
  validates :gender, :author, :image, :title, :editor, :year, presence: true
  scope :long_title, -> { all.select { |book| book.title.size > 25 } }

  def self.long_title
    Book.long_title
  end
end
