class CustomersController < ApplicationController
  def show
    @customers = Contact.where(:is_customer =>true).all
  end
  def index
     @customers = Contact.where(:is_customer =>true).all
       @contacts = session[:contacts]
     # @customers.each do |customer|
      # @invoices = Invoice.where(:contact_id== customer.id)
     # end
  end
end

