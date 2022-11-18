module Transactions
  class CreateForm
    include ActiveModel::Model
    include Transactionable

    attr_accessor :type, :uuid, :amount, :status, :customer_email, :customer_phone, :follow_transaction_id, :merchant, :record

    validates :type, inclusion: { in: %w(AuthorizeTransaction ChargeTransaction RefundTransaction ReversalTransaction) }
    validate :merchant_activeness

    def save
      begin
        # Valid will setup the Form object errors
        if valid?
          @record = Transaction.create!(type: type, uuid: uuid, amount: amount, status: status, customer_email: customer_email,
                                        merchant: merchant, customer_phone: customer_phone, follow_transaction_id: follow_transaction_id)

        end
      rescue => e
        self.errors.add(:base, e.message)
        false
      end
    end
  end
end
