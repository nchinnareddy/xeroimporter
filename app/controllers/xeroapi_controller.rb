require 'rubygems'
require 'xeroizer'

class XeroapiController < ApplicationController
  before_filter :get_xero
  
  #XERO_API_CONS_KEY =  "ZXNTUHOS5YARBUHM27YCGACX7ULQDS"
  #XERO_API_SECR_KEY =  "QA7N1PDWQAEALBTT8L5QLGACLL2KTP"
  
  XERO_API_CONS_KEY =  "LFKMA7NPILRCDIGG4UZIQWGKF4WKGD"
  XERO_API_SECR_KEY =  "UU3SGCUBD3UIL7OS4WTOT5F2X14MWL"
  public
  def new
      request_token = @xero_client.request_token(:oauth_callback => 'http://192.168.1.26:3000/xeroapi/new')
      session[:request_token] = request_token.token
      session[:request_secret] = request_token.secret

      redirect_to request_token.authorize_url
  end

  def create
    @xero_client.authorize_from_request(
                    session[:request_token], 
                    session[:request_secret], 
                    :oauth_verifier => params[:oauth_verifier] )

    session[:xero_auth] = {
            :access_token => @xero_client.access_token.token,
            :access_key => @xero_client.access_token.key }

    session.data.delete(:request_token)
    session.data.delete(:request_secret)
  end

  def destroy
    session.data.delete(:xero_auth)
  end

  # def setup
    # #ve giao dien trang so 10 cua document
  # end

  #def setup
    #client = Xeroizer::PrivateApplication.new(XERO_API_CONS_KEY, XERO_API_SECR_KEY, "#{Rails.root}/public/privatekey.pem")
  #  client = Xeroizer::PublicApplication.new(XERO_API_CONS_KEY, XERO_API_SECR_KEY)
    # request_token = client.request_token(:oauth_callback => 'http://localhost:3000/oauth/callback')
    # redirect_to request_token.authorize_url
    # client.authorize_from_request(request_token.token, request_token.secret, :oauth_verifier => params[:oauth_verifier])
  #  contacts = client.Contact.all
  #end

  def get_xero
    #@xero = Xeroizer::PrivateApplication.new(XERO_API_CONS_KEY, XERO_API_SECR_KEY, "#{Rails.root}/public/privatekey.pem")
    @xero_client = Xeroizer::PublicApplication.new(XERO_API_CONS_KEY, XERO_API_SECR_KEY)
    Rails.logger.info "Rails Xero Client: #{@xero_client.nil? ? "Nil" : @xero_client.to_s}"

    # Add AccessToken if authorised previously.
    if session[:xero_auth]
        @xero_client.authorize_from_access(
            session[:xero_auth][:access_token], 
            session[:xero_auth][:access_key] )
    end
  end

end