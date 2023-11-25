class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order=Order.new
  end

  def confirm
    if params[:order][:address_option]=="0"
      @order = Order.new(order_params)
      @order.post_code = current_customer.post_cord
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option]=="1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.shipping_post_code
      @order.address = @address.shipping_address
      @order.name = @address.shipping_name
    else
      @order = Order.new(order_params)
    end
    @cart_items=current_customer.cart_items
    @postage=@order.postage
    @total = 0
    @billing=@postage+@total
  end

  def create
    order=Order.new(order_params)
    order.save
    cart_items=current_customer.cart_items

    cart_items.each do |cart_item|
      @order_details=OrderDetail.new
      @order_details.order_id=order.id
      @order_details.item_id=cart_item.item.id
      @order_details.piece=cart_item.amount
      @order_details.price=cart_item.item.item_total_price
      @order_details.save
    end
    redirect_to orders_complete_path
    current_customer.cart_items.destroy_all
  end

  def complete
  end

  def index
    @orders = current_customer.orders.page(params[:page]).per(5)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment, :post_code, :address, :name, :postage, :customer_id, :billing_amount)
  end
end
