class ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  before_action :set_locale

  private

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end
end
