class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact_number
      t.string :contact_status
      t.string :contact_name ,:limit => 10000
      t.string :fist_name , :limit =>255
      t.string :last_name, :limit => 255
      t.string :email_address, :limit => 500
      t.string :skype_name
      t.string :bank_account
      t.string :address
      t.string :phone
      t.boolean :is_supplier
      t.boolean :is_customer
      t.string :default_currency
      t.timestamps
    end
  end
end
