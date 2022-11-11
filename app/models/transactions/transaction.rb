# frozen_string_literal: true

class Transaction < ApplicationRecord
  # associations
  belongs_to :merchant
  belongs_to :follow_transaction, class_name: 'Transaction', optional: true

  # validations
  validates :amount, numericality: { greater_than: 0 }, allow_nil: true
  validates :customer_email, presence: true
  validates :customer_phone, presence: true
  validates :uuid, presence: true
end
