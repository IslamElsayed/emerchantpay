# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeleteObseleteTransactionsJob, type: :job do
  describe '#perform_sync' do
    before { create_list(:transaction, 5, type: 'AuthorizeTransaction' , created_at: 2.hours.ago) }

    it 'deletes transactions created more than one hour ago' do
      expect { DeleteObseleteTransactionsJob.perform_sync }.to change { Transaction.count }.by(-5)
    end
  end
end
