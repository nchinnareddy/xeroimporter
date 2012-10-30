class FixTablePayments < ActiveRecord::Migration
  def up
    drop_table :payments
    create_table :payments do |t|
      t.string    :invoice_id
      t.string    :account_id
      t.string    :payment_id
      t.date      :date
      t.decimal   :amount
      t.decimal   :currency_rate
      t.string    :payment_type
      t.string    :status
      t.string    :reference
      t.datetime  :updated_date_utc, :api_name => 'UpdatedDateUTC'
      
    end
  end

  def down
    drop_table :payments
  end
end
