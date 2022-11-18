# frozen_string_literal: true

class Transaction < ApplicationRecord
  include Transactionable

  enum status: %i[approved reversed refunded error]

  # associations
  belongs_to :merchant
  belongs_to :follow_transaction, class_name: 'Transaction', optional: true

  # validations
  validates :uuid, uniqueness: true
  validate :merchant_activeness, on: :create
end
