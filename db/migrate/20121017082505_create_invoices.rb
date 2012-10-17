class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
    t.string :contact_id
    t.datetime :due_date
    t.datetime :issued_date
    t.string :invoice_number
    t.string :status
    t.boolean :sent_to_contact
    t.decimal :amount_due
    t.decimal :amount_paid
    t.decimal :amount_credited
    t.datetime :update_date_utc
    t.string :credit_notes
    t.decimal :total_discount   
      t.timestamps
    end
  end
end
