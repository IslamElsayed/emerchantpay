# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeleteObseleteTransactionsJob, type: :job do
  describe '#perform_sync' do
    context 'with records older than 1 hour' do
      before { create_list(:transaction, 5, type: 'AuthorizeTransaction',
                                            created_at: 2.hours.ago) }

      it 'deletes transactions created more than one hour ago' do
        expect { DeleteObseleteTransactionsJob.perform_sync }.to change { Transaction.count }.by(-5)
      end
    end

    context 'with records younger than 1 hour' do
      before { create_list(:transaction, 5, type: 'AuthorizeTransaction') }

      it 'deletes transactions created more than one hour ago' do
        expect { DeleteObseleteTransactionsJob.perform_sync }.not_to change { Transaction.count }
      end
    end
  end
end
