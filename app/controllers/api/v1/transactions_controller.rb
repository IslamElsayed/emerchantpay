# frozen_string_literal: true

module Api
  module V1
    class TransactionsController < Api::V1::ApplicationController
      def create
        transaction = current_user.transactions.new(transaction_params)
        if transaction.save
          render json: transaction, status: 201
        else
          render json: transaction.errors, status: 422
        end
      end

      private

      def transaction_params
        params.require(:transaction).permit(:type, :uuid, :amount, :status, :customer_email, :customer_phone,
                                            :follow_transaction_id)
      end
    end
  end
end
