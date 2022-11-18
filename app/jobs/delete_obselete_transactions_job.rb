# frozen_string_literal: true

class DeleteObseleteTransactionsJob < ApplicationJob
  def perform
    Transaction.where('created_at < ? ', 1.hours.ago).destroy_all
  end
end
