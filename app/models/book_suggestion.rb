class BookSuggestion < ApplicationRecord
  belongs_to :user
  validates :user, :author, :title, :link, :editor, :year, presence: true
end
