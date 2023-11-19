class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @customer=current_customer
    @customers=Customer.all
  end
end
