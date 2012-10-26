class Invoice < ActiveRecord::Base
  belongs_to :contact
  has_many :payments
  attr_accessible :contact_id, :invoice_number, :due_date,:issued_date,:status,:sent_to_contact
end
