# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :clients

  resources :clients do
    resources :accounts, except: [:update]
    resources :transfers, only: [:create]
  end
end
