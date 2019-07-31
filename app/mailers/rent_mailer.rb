class RentMailer < ApplicationMailer
  def creation_rent(rent)
    email = rent.user.email
    book = rent.book

    @message = { 'creation_date' => rent.created_at, 'book_name' => book.title,
                 'book_author' => book.author, 'book_gender' => book.gender,
                 'book_editor' => book.editor, 'book_year' => book.year,
                 'start_date' => rent.start_date, 'end_date' => rent.end_date }

    mail to: email
  end
end
