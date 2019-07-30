class RentMailer < ApplicationMailer
  def creation_rent(rent)
    email = User.find(rent.user_id).email
    book = Book.find(rent.book_id)

    @greeting = "Creation Date: #{rent.created_at}\n  Book Name: #{book.title}\n  Book author: #{book.author}\n  Book gender: #{book.gender}\n  Book editor: #{book.editor}\n  Book year: #{book.year}\n  Start Date: #{rent.start_date}\n  End Date: #{rent.end_date}"

    mail to: email
  end
end
