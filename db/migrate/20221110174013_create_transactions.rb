# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :type, index: true
      t.string :uuid
      t.float :amount
      t.integer :status, default: 0
      t.string :customer_email
      t.string :customer_phone
      t.references :merchant
      t.references :follow_transaction

      t.timestamps
    end
  end
end
