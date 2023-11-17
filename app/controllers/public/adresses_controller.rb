class Public::AdressesController < ApplicationController
  def index
    @address = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect address_path, notice: "配送先の登録に成功しました。"
    else
      @address = current_customer.address
      render :index
      flash.now[:alert] = "配送先の登録に失敗しました。"
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def destory
  end

  def update
  end

  private

  def address_params
    params.require(:address).permit(:shipping_post_code, :shipping_address, :shipping_name)
  end

end