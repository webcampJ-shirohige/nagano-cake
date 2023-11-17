class Public::AdressesController < ApplicationController
  def index
    @shipping = Shipping.new
  end
end
