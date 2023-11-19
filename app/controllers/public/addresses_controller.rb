class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.addresses(params:[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      @customer = current_customer
      @addresses = @customer.addresses(params[:id])
      render :index
    end

    def edit
      @address = Address.find(params[:id])
    end

    def update
      @address = Address.find(params[:id])
      @address.update(address_params)
      redirect_to addresses_path
    end

    def destroy
      address = Address.find(params[:id])
      address.destroy
      redirect_to addresses_path
    end
  end

    private

    def address_params
      params.require(:address).permit(:shipping_post_code, :shipping_address, :shpping_name)
    end
  end