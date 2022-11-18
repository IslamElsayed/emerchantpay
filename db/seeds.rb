# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.create(email: 'admin@email.com', name: 'admin', password: 123456)

3.times do |i|
  merchant = Merchant.create(email: "merchant#{i}@email.com", name: "merchant#{i}", password: 123456)
  %w(AuthorizeTransaction ChargeTransaction RefundTransaction ReversalTransaction).each do |transaction_type|
    merchant.transactions.create!(customer_email: 'customer@email.com', customer_phone: 123456789, uuid: "uuid#{merchant.id}",
                                  type: transaction_type, amount: 10)
  end
end
