# frozen_string_literal: true

Rails.application.routes.draw do
  resources :transactions, only: [:index]
  devise_for :users

  root 'transactions#index'
end
