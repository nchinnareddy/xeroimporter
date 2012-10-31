class CustomersController < ApplicationController
  def show
    @customers = Contact.where(:is_customer =>true).all
  end
  def index
       @contacts = session[:contacts]
       #@customers = @contacts.where(:is_customer => true)
     # @customers.each do |customer|
      # @invoices = Invoice.where(:contact_id== customer.id)
     # end
  end
end

