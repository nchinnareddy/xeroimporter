class Payment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :invoice_id, :account_id,:date_payment
  belongs_to :contact
  belongs_to :invoice
end
