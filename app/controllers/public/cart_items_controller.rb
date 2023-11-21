class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @total_payment = 0
  end

  def update
  end

  def create
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_item_params
  end
end