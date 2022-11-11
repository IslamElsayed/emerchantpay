# frozen_string_literal: true

class RefundTransaction < Transaction
  # validations
  validates :amount, presence: true
end
