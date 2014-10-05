class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(:created_at)
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:notice] = "Manufacturer Added."
      redirect_to manufacturers_path
    else
      flash.now[:notice] = "Please insert information in both fields!"
      render :new
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
