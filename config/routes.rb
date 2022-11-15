# frozen_string_literal: true

Rails.application.routes.draw do
  resources :transactions, only: [:index]
  devise_for :users

  constraints AdminConstraint.new do
    get '/', to: 'admins/merchants#index'

    scope module: 'admins' do
      resources :merchants do
        resources :transactions, only: [:index]
      end
    end
  end

  root 'transactions#index'
end
