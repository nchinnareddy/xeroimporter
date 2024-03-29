require 'rubygems'
require 'xeroizer'

class XeroapiController < ApplicationController
  public
  def index

  end
  def new
  end

  def create
  end

  def synchronize
    
    @xero_client = session[:xero_client]
    Rails.logger.info "xero_clientsession #{@xero_client.to_s}"
    unless @xero_client == nil
    @xero_client.authorize_from_request(session[:request_token],session[:request_secret],:oauth_verifier => params[:oauth_verifier])
    end
    @contacts = @xero_client.Contact.all(:order => 'contact_name')
    @payments= @xero_client.Payment.all(:order => 'updated_date_utc')
    @invoices = @xero_client.Invoice.all(:order =>'type')
    #Rails.logger.info "Rails Contact: #{@contacts.first.to_s}"
    #reset_session
    session[:contacts] = @contacts
    session[:payments] = @payments
    session[:invoices] = @invoices
    Rails.logger.info "Invoices #{@invoices.to_s}"
    redirect_to "/xeroapi/index"
      
  end

  def destroy
    session.data.delete(:xero_auth)
  end

  def get_xero
    @xero_client = Xeroizer::PublicApplication.new(params[:XERO_API_CONS_KEY],params[:XERO_API_SECR_KEY])
    Rails.logger.info "Rails Xero param: #{params[:XERO_API_SECR_KEY].to_s}"
    request_token = @xero_client.request_token(:oauth_callback => ':3000/xeroapi/synchronize')
    session[:request_token] = request_token.token
    session[:request_secret] = request_token.secret
    session[:xero_client] = @xero_client
    redirect_to request_token.authorize_url
  end
end