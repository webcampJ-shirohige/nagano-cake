class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_payment = 0
    @postage = @order.postage
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
        if  @order.status == "入金確認"
            @order_details.update_all(create_status: 1)
        end
    end
     redirect_to admin_order_path(@order.id)
    # @order_details = OrderDetail.find(params[:id])
    # @order_details.update(order_detail_params)
    # redirect_to admin_order_path(@order.id)
  end

  def order_params
     params.require(:order).permit(:status)
  end
end

