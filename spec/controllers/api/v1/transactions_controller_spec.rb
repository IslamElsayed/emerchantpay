# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do
  describe 'POST #create' do
    let(:merchant) { create(:user, :merchant) }
    before do
      sign_in(merchant)
      request.headers['Authorization'] = "Token #{merchant.token}"
    end

    context 'with valid params' do
      it 'returns http success' do
        expect do
          post :create,
               params: { transaction: { customer_email: 'email@email.com', customer_phone: '123456789', uuid: 'uuid',
                                        type: 'AuthorizeTransaction', amount: 100 } }
        end.to change { Transaction.count }.by(1)
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid params' do
      it 'returns http unprocessable entity' do
        post :create, params: { transaction: { customer_email: 'email@email.com' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
