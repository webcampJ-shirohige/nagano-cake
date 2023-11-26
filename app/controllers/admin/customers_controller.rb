class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer= Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end


  def update
    @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
        redirect_to admin_customer_path(@customer.id)
   else
      render :edit
   end
  end
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_cord, :address, :telephone_number, :email, :is_active )
  end
end
