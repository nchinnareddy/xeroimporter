class FixColumnName < ActiveRecord::Migration
  def up
    drop_table :contacts
     create_table :contacts do |t|
      t.string :contact_id
      t.string  :contact_number
      t.string :contact_status
      t.string :name
      t.string :tax_number
      t.string :bank_account_details
      t.string :accounts_receivable_tax_type
      t.string :accounts_payable_tax_type
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :skype_user_name
      t.string :contact_groups
      t.string :default_currency
      t.datetime :updated_date_utc, :api_name => 'UpdatedDateUTC'
      t.boolean :is_supplier
      t.boolean :is_customer
      t.timestamps
    end
  end

  def down
    drop_table :contacts
  end
end
