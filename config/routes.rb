# frozen_string_literal: true
require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount_devise_token_auth_for 'User', at: 'auth'
  mount Sidekiq::Web, at: 'sidekiq'

  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :book, only: [:index, :show, :create]
    resources :rent, only: [:index, :create]
    resources :book_suggestion, only: [:create]
    resources :open_library, only: [:show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
