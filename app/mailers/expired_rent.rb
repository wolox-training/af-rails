class ExpiredRent < ApplicationMailer
  def expired_rent(rent)
    @user = User.find(rent.user_id)
    @book = Book.find(rent.book_id)
    mail to: @user.email
    mail subject: I18n.t('subject')
  end
end
