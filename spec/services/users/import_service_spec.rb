# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::ImportService do
  let(:subject) { described_class.new('spec/support/users_sample.csv') }

  describe '#execute' do
    context 'with valid data' do
      it 'creates users from file successfully' do
        expect { subject.execute }.to change { User.count }.by(3)
      end
    end

    context 'with invalid data' do
      before { subject.execute }

      it 'fails to create users' do
        expect { subject.execute }.not_to change { User.count }
      end
    end
  end
end
