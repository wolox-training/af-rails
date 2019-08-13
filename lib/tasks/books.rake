namespace :books do
  desc "Change books titles that they are longer than 25"
  task truncate_title: :environment do
    books = Books.long_title
    books.each do |book|
      book.truncate(25)
    end
  end
end
