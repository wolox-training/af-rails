class ApiController < ApplicationController
  rescue_from Errors::OpenLibrary::BookNotFound, with: :book_not_found
  rescue_from Errors::Rent::RentCreationFailed, with: :book_not_exist
  rescue_from Errors::Book::BookCreationFailed, with: :book_not_created
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  def book_not_found(exception)
    render json: { errors: exception.message }, status: :not_found
  end

  private

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end
end
