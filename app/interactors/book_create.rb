class BookCreate < InteractorBase
  def call
    @book = Book.new(context.book)
    context.fail!(message: I18n.t('The book did not create')) unless @book.save
    context.result = @book
  end
end
