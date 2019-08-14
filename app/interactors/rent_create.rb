class RentCreate < InteractorBase
  def call
    @rent = Rent.new(context.rent)
    unless @rent.save
      context.fail!(message: I18n.t('services.rent.errors.rent_creation',
                                    book_id: @rent.book_id))
    end
    context.result = @rent
  end
end
