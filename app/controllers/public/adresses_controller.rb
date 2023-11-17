class Public::AdressesController < ApplicationController
  def index
    @address = Address.new
  end

  def create
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def destory
  end

  def update
  end

end