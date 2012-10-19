class AddUsercomfirmMail < ActiveRecord::Migration
  def up
    add_column :users, :unconfirmed_email, :string
    add_column :users, :is_admin, :boolean

  end

  def down
    remove_column :users,:unconfirmed_email
    remove_column :users, :is_admin
  end
end
