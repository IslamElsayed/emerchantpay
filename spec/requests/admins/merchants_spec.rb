# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Merchants', type: :request do
  let(:admin) { create(:user, :admin) }
  let(:merchant) { create(:user, :merchant) }
  before { sign_in(admin) }

  describe 'GET /index' do
    it 'returns http success' do
      get '/merchants'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/merchants/#{merchant.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get "/merchants/#{merchant.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http redirect' do
      delete "/merchants/#{merchant.id}"
      expect(response).to have_http_status(:redirect)
    end
  end
end
