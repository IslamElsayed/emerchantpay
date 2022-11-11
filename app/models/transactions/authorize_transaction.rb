# frozen_string_literal: true

class AuthorizeTransaction < Transaction
  # validations
  validates :amount, presence: true
end
