class FixTableAccounts < ActiveRecord::Migration
  def up
    drop_table :accounts
    create_table  :accounts do |t|
      t.string  :account_id
      t.string  :code
      t.string  :name
      t.string  :type
      t.string  :class, :internal_name => :account_class
      t.string  :status
      t.string  :currency_code
      t.string  :tax_type
      t.string  :description
      t.string  :system_account
      t.boolean :enable_payments_to_account

    end
  end

  def down
    drop_table :accounts
  end
end
