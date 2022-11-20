# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Merchants', type: :request do
  let(:admin) { create(:user, :admin) }
  let!(:merchant) { create(:user, :merchant) }
  before { sign_in(admin) }

  describe 'GET /index' do
    it 'returns http success' do
      get '/merchants'
      expect(response).to have_http_status(:success)
      expect(controller.instance_variable_get(:@merchants)).to eq([merchant])
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get "/merchants/#{merchant.id}/edit"
      expect(response).to have_http_status(:success)
      expect(controller.instance_variable_get(:@merchant)).to eq(merchant)
    end
  end

  describe 'PUT /update' do
    context 'with valid params' do
      it 'returns http redirect' do
        expect do
          put "/merchants/#{merchant.id}", params: { merchant: { name: 'name' } }
        end.to change { merchant.reload.name }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'with invalid params' do
      it 'returns http unprocessable_entity' do
        put "/merchants/#{merchant.id}", params: { merchant: { name: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /destroy' do
    it 'returns http redirect' do
      expect do
        delete "/merchants/#{merchant.id}"
      end.to change { Merchant.count }.by(-1)
      expect(response).to have_http_status(:redirect)
    end
  end
end
