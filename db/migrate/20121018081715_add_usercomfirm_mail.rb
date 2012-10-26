class AddUsercomfirmMail < ActiveRecord::Migration
  def up
    add_column :users, :unconfirmed_email, :string
    add_column :users, :is_admin, :boolean
    remove_column :invoices, :contact_id
    add_column :invoices,:contact_id,:integer
    remove_column :payments, :invoice_id
    remove_column :payments,:account_id
    add_column :payments,:invoice_id,:integer
    add_column :payments,:account_id,:integer

  end

  def down
    remove_column :users,:unconfirmed_email
    remove_column :users, :is_admin
    remove_column :invoices,:contact_id
    remove_column :payments,:account_id
    remove_column :payments, :invoice_id
  end
end
