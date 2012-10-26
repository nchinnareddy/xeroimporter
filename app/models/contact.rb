class Contact < ActiveRecord::Base
  # attr_accessible :title, :body
     attr_accessible :is_customer, :contact_name, :email_address,:contact_number,:contact_status
   has_many :invoices
   has_many :payments
end
