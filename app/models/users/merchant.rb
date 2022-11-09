# frozen_string_literal: true

class Merchant < User
  enum :status, %i[active inactive]
end
