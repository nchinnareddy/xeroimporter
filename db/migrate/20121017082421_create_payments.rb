class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string   :invoice_id
      t.string   :account_id
      t.datetime :date_payment
      t.string   :currency_rate
      t.decimal  :amount
      t.string   :reference
      t.timestamps
    end
  end
end
