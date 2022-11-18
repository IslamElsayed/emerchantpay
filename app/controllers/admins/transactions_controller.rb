# frozen_string_literal: true

module Admins
  class TransactionsController < ::ApplicationController
    before_action :set_merchant

    def index
      @transactions = @merchant.transactions
    end

    private

    def set_merchant
      @merchant = Merchant.find(params[:merchant_id])
    end
  end
end
