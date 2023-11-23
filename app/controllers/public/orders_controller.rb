class Public::OrdersController < ApplicationController

  def new
    @order=Order.new
  end

  def confirm
    if address_option=0
      @order = Order.new(order_params)
      @order.post_code = current_customer.post_cord
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif address_option=1
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order = Order.new(order_params)
    end
    @cart_items=current_customer.cart_items
  end

  private

  def order_params
    params.require(:order).permit(:payment, :post_code, :address, :name)
  end
end
