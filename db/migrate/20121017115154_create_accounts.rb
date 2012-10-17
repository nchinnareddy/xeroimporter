class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string  :code
      t.string  :name
      t.string  :status
      t.string  :type
      t.string  :description
      t.string  :tax_type
      t.boolean :enable_payment
      t.boolean :show_expense_claims
      t.string  :currency_code
      t.string  :report_code
      t.string :report_codename
      t.timestamps
    end
  end
end
