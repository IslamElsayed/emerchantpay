# frozen_string_literal: true

module Api
  module V1
    class TransactionsController < Api::V1::ApplicationController
      def create
        transaction_form = Transactions::CreateForm.new(transaction_params.merge(merchant: current_user))

        if transaction_form.save
          render json: transaction_form.record, status: 201
        else
          render json: transaction_form.errors, status: 422
        end
      end

      private

      def transaction_params
        params.require(:transaction).permit(:type, :uuid, :amount, :status, :customer_email, :customer_phone, :follow_transaction_id)
      end
    end
  end
end
