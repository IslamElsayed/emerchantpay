# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  let(:admin) { create(:user, :admin) }
  let(:merchant) { create(:user, :merchant) }
  before { sign_in(admin) }

  describe 'GET /index' do
    it 'returns http success' do
      get "/merchants/#{merchant.id}/transactions"
      expect(response).to have_http_status(:success)
    end
  end
end
