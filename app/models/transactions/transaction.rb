# frozen_string_literal: true

class Transaction < ApplicationRecord
  enum status: %i[approved reversed refunded error]

  # associations
  belongs_to :merchant
  belongs_to :follow_transaction, class_name: 'Transaction', optional: true

  # validations
  validates :amount, numericality: { greater_than: 0 }, allow_nil: true
  validates :customer_email, presence: true
  validates :customer_phone, presence: true
  validates :uuid, presence: true, uniqueness: true
  validate :merchant_activeness, on: :create

  private

  def merchant_activeness
    errors.add(:merchant, 'must be active') if merchant&.inactive?
  end
end
