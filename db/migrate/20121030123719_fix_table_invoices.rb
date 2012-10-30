class FixTableInvoices < ActiveRecord::Migration
  def up
    drop_table :invoices
    create_table  :invoices do |t|
      t.string    :invoice_id
      t.string    :contact_id
      t.string    :invoice_number
      t.string    :reference
      t.string    :branding_theme_id
      t.string    :url
      t.string    :type
      t.date      :date
      t.date      :due_date
      t.string    :status
      t.string    :line_amount_types
      t.decimal   :sub_total, :calculated => true
      t.decimal   :total_tax, :calculated => true
      t.decimal   :total, :calculated => true
      t.decimal   :amount_due
      t.decimal   :amount_paid
      t.decimal   :amount_credited
      t.datetime  :updated_date_utc, :api_name => 'UpdatedDateUTC'
      t.string    :currency_code
      t.datetime  :fully_paid_on_date
      t.boolean   :sent_to_contact
      
    end
  end

  def down
    drop_table :invoices
  end
end
