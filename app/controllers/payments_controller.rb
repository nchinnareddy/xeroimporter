class PaymentsController < ApplicationController
  def index
     session[:payments] = @payments
  end
end
