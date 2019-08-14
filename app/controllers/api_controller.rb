class ApiController < ApplicationController
  rescue_from Errors::OpenLibrary::BookNotFound, with: :book_not_found
  rescue_from Errors::Rent::RentCreationFailed, with: :book_not_exist
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  before_action :set_locale

  def book_not_found(exception)
    render json: { errors: exception.message }, status: :not_found
  end

  def book_not_exist(exception)
    render json: { errors: exception.message }, status: :unprocessable_entity
  end

  private

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end
end
