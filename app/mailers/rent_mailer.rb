class RentMailer < ApplicationMailer
  def new_rent(rent_id)
    @rent = Rent.find(rent_id)
    @user = User.find(@rent.user_id)
    @book = Book.find(@rent.book_id)
    mail to: @user.email
    if @user.locale == 'en'
      mail subject: 'New rent information'
    else
      mail subject: 'Información de nuevo rent'
    end
  end
end
