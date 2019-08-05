# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_locale
  protect_from_forgery with: :null_session

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end
end
