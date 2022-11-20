# frozen_string_literal: true

module Transactionable
  extend ActiveSupport::Concern

  included do
    validates :amount, numericality: { greater_than: 0 }, allow_nil: true
    validates :customer_email, presence: true
    validates :customer_phone, presence: true
    validates :uuid, presence: true
    validates :type, presence: true

    private

    def merchant_activeness
      errors.add(:merchant, 'must be active') if merchant&.inactive?
    end
  end
end
