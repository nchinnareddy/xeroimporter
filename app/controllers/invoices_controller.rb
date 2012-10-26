require 'rubygems'
require 'xeroizer'
class InvoicesController < ApplicationController
  
  def index
    #xero = Xeroizer::PublicApplication.new(ZXNTUHOS5YARBUHM27YCGACX7ULQDS, QA7N1PDWQAEALBTT8L5QLGACLL2KTP)
    #xero.authorize_from_access(session[:xero_auth][:access_token], session[:xero_auth][:access_key])
     @invoices =Invoice.all
  end
end
