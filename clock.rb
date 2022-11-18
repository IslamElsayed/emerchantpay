# frozen_string_literal: true

require 'clockwork'
include Clockwork

handler do |job|
  puts "Running #{job}"
end

every(1.hour, 'DeleteObseleteTransactionsJob')
