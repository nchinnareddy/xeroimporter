require 'rubygems'
require 'xeroizer'

class XeroapiController < ApplicationController
  #before_filter :get_xero

  #XERO_API_CONS_KEY =  "ZXNTUHOS5YARBUHM27YCGACX7ULQDS"
  #XERO_API_SECR_KEY =  "QA7N1PDWQAEALBTT8L5QLGACLL2KTP"

  #XERO_API_CONS_KEY =  "PQSHNYFPCK6IW2M8H4VOGD95FA4GMQ"
  #XERO_API_SECR_KEY =  "GLWSYYTCORTVKNOINQ6JILSLSFCECG"
  public
  def new
    
  end

  def create

  end

  def synchronize
    Rails.logger.info "Rails Xero Client: #{session[:request_token]}; #{session[:request_secret]}; #{params[:oauth_verifier]}"
    @xero_client.authorize_from_request(session[:request_token],session[:request_secret],:oauth_verifier => params[:oauth_verifier])
    Rails.logger.info "Rails Xero Client: #{@xero_client.nil? ? "Nil" : @xero_client.to_s}"
    Rails.logger.info "Access Token: #{@xero_client.access_token.nil? ? "Nil" : @xero_client.access_token.token}"
    Rails.logger.info "Access Token: #{@xero_client.access_token.nil? ? "Nil" : @xero_client.access_token.to_s}"
    session[:xero_auth] = {:access_token => @xero_client.access_token.token, :access_key => @xero_client.access_token.key }
    session.data.delete(:request_token)
    session.data.delete(:request_secret)
    contacts = @xero_client.Contact.all(:order => 'contact_name')
    Rails.logger.info "Contacts: #{contacts.to_s}"
  end

  def destroy
    session.data.delete(:xero_auth)
  end

  def get_xero
    @xero_client = Xeroizer::PublicApplication.new(params[:XERO_API_CONS_KEY],params[:XERO_API_SECR_KEY])
    Rails.logger.info "Rails Xero param: #{params[:XERO_API_SECR_KEY].to_s}"
    # Add AccessToken if authorised previously.
    request_token = @xero_client.request_token(:oauth_callback => ':3000/xeroapi/synchronize')
    session[:request_token] = request_token.token
    session[:request_secret] = request_token.secret
    redirect_to request_token.authorize_url
  end
end