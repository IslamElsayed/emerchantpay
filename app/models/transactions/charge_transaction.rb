# frozen_string_literal: true

class ChargeTransaction < Transaction
  # validations
  validates :amount, presence: true
end
