class RentMailer < ApplicationMailer
  def creation_rent(rent)
    email = User.find(rent.user_id).email
    book = Book.find(rent.book_id)

    @message = { 'creation_date' => rent.created_at, 'book_name' => book.title,
                 'book_author' => book.author, 'book_gender' => book.gender,
                 'book_editor' => book.editor, 'book_year' => book.year,
                 'start_date' => rent.start_date, 'end_date' => rent.end_date }

    mail to: email
  end
end
