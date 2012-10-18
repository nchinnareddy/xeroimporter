require 'rubygems'
require 'xeroizer'

class XeroapiController < ApplicationController
  def setup
    #ve giao dien trang so 10 cua document
  end
  
  def synchronize
    # params[:consumer_key], params[:secret_key]
    #code phan dong bo hoa du lieu  

  # # Create client (used to communicate with the API).
  # client = Xeroizer::PublicApplication.new(YOUR_OAUTH_CONSUMER_KEY, YOUR_OAUTH_CONSUMER_SECRET)
 
  # # Retrieve list of contacts (note: all communication must be made through the client).
  # contacts = client.Contact.all(:order => 'Name')
  end
  
end
