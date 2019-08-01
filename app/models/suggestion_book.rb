class SuggestionBook < ApplicationRecord
  belongs_to :user
  validates :author, :title, :link, :editor, :year, presence: true
end
