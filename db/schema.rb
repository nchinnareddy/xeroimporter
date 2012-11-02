# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121031031104) do

  create_table "accounts", :force => true do |t|
    t.string  "account_id"
    t.string  "code"
    t.string  "name"
    t.string  "type"
    t.string  "class"
    t.string  "status"
    t.string  "currency_code"
    t.string  "tax_type"
    t.string  "description"
    t.string  "system_account"
    t.boolean "enable_payments_to_account"
  end

  create_table "contacts", :force => true do |t|
    t.string   "contact_id"
    t.string   "contact_number"
    t.string   "contact_status"
    t.string   "name"
    t.string   "tax_number"
    t.string   "bank_account_details"
    t.string   "accounts_receivable_tax_type"
    t.string   "accounts_payable_tax_type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "skype_user_name"
    t.string   "contact_groups"
    t.string   "default_currency"
    t.datetime "updated_date_utc"
    t.boolean  "is_supplier"
    t.boolean  "is_customer"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "invoices", :force => true do |t|
    t.string   "invoice_id"
    t.string   "contact_id"
    t.string   "invoice_number"
    t.string   "reference"
    t.string   "branding_theme_id"
    t.string   "url"
    t.string   "type"
    t.date     "date"
    t.date     "due_date"
    t.string   "status"
    t.string   "line_amount_types"
    t.decimal  "sub_total"
    t.decimal  "total_tax"
    t.decimal  "total"
    t.decimal  "amount_due"
    t.decimal  "amount_paid"
    t.decimal  "amount_credited"
    t.datetime "updated_date_utc"
    t.string   "currency_code"
    t.datetime "fully_paid_on_date"
    t.boolean  "sent_to_contact"
  end

  create_table "payments", :force => true do |t|
    t.string   "invoice_id"
    t.string   "account_id"
    t.string   "payment_id"
    t.date     "date"
    t.decimal  "amount"
    t.decimal  "currency_rate"
    t.string   "payment_type"
    t.string   "status"
    t.string   "reference"
    t.datetime "updated_date_utc"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "username"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "unconfirmed_email"
    t.boolean  "is_admin"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
