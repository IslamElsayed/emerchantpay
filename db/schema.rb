# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_221_110_174_013) do
  create_table 'transactions', force: :cascade do |t|
    t.string 'type'
    t.string 'uuid'
    t.float 'amount'
    t.integer 'status', default: 0
    t.string 'customer_email'
    t.string 'customer_phone'
    t.integer 'merchant_id'
    t.integer 'follow_transaction_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['merchant_id'], name: 'index_transactions_on_merchant_id'
    t.index ['follow_transaction'], name: 'index_transactions_on_follow_transaction'
    t.index ['type'], name: 'index_transactions_on_type'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'type'
    t.integer 'status', default: 0
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
