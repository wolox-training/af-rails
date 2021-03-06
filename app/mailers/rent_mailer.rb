class RentMailer < ApplicationMailer
  def new_rent(rent_id)
    @rent = Rent.find(rent_id)
    @user = User.find(@rent.user_id)
    @book = Book.find(@rent.book_id)
    mail to: @user.email
    mail subject: I18n.t('subject')
  end

  def expired_rent(rent)
    @user = User.find(rent.user_id)
    @book = Book.find(rent.book_id)
    mail to: @user.email
    mail subject: I18n.t('subject_expired_mail')
  end
end
