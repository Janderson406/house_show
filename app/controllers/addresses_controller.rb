class AddressesController < ApplicationController
  before_action :authenticate_user!

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new(address_params)
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    @address.save
    redirect_to root_path #profile path?
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    if @address.save
      flash[:notice] = "Address was updated."
      redirect_to root_path #profile path?
    else
      flash.now[:alert] = "Error updating address. Please try again."
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:street, :zip, :city, :state, :user_id, :event_id)
  end


end
