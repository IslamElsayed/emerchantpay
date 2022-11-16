# frozen_string_literal: true

Rails.application.routes.draw do
  resources :transactions, only: [:index]
  devise_for :users, controllers: { sessions: 'users/sessions' }

  constraints AdminConstraint.new do
    get '/', to: 'admins/merchants#index'

    scope module: 'admins' do
      resources :merchants do
        resources :transactions, only: [:index]
      end
    end
  end

  root 'transactions#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :transactions, only: [:create]
      devise_for :merchant
    end
  end
end
