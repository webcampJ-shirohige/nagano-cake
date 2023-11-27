class Admin::OrderDetailsController < ApplicationController

  def update
    order_detail = OrderDetail.find(params[:id])
    if order_detail.update(order_detail_params)
      if order_detail.create_status == "in_production"
         order_detail.order.update(status: 2)
      end
      if order_detail.create_status == "production_complete"
         order_detail.order.update(status: 3)
      end
    end
     redirect_to admin_order_path(order_detail.order.id)
  end

  def order_detail_params
     params.require(:order_detail).permit(:create_status)
  end
end
