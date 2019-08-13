class Book < ApplicationRecord
  has_many :rent, dependent: :destroy
  validates :gender, :author, :image, :title, :editor, :year, presence: true
  scope :long_title, -> { where('length(title) > ?', 25) }
end
