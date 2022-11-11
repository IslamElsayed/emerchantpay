# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should validate_presence_of(:customer_email) }
  it { should validate_presence_of(:customer_phone) }
  it { should validate_presence_of(:uuid) }
end
