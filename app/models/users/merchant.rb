# frozen_string_literal: true

class Merchant < User
  enum status: %i[active inactive]

  # associations
  has_many :transactions

  # callbacks
  before_save :generate_token

  def total_transaction_sum
    transactions.approved.sum(:amount)
  end

  private

  def generate_token
    self.token ||= SecureRandom.urlsafe_base64
  end
end
