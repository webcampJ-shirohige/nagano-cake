class Public::ItemsController < ApplicationController

  def index
    @items=Item.where(is_selling_status: true).page(params[:page])
  end

  def show
    @item=Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
