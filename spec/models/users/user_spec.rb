# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#name' do
    it { should validate_presence_of(:name) }
  end
end
