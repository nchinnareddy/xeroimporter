class CustomersController < ApplicationController
  def show
    @customer = Contact.where(:is_customer =>true).all
  end
  def index
    
  end
end
