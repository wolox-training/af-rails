class ModificationOldsTitleByLimitationCharacters < ActiveRecord::Migration[5.1]
  def update
    Books.all.each do |book|
      if book.size < 25
        book.title = "#{book.title[0..22]}..."
        Books.update(book)
      end
    end
  end
end
