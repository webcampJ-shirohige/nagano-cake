class Public::AddressesController < ApplicationController
  #before_action :authenticate_customer!
  def index
    @address = Address.new
    #@customer = current_customer
    #@addresses = @customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      @customer = current_customer
      @addresses = @customer.addresses
      render :index
    end
  end

  def edit
      @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:shipping_post_code, :shipping_address, :shipping_name)
  end
end