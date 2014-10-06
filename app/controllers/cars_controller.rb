class CarsController < ApplicationController
  def index
    @cars = Car.order(created_at: :desc)
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    params = car_params
    params[:manufacturer] = Manufacturer.find(car_params[:manufacturer])
    @car = Car.new(params)
    if @car.save
      redirect_to cars_path
    else
      flash.now[:notice] = 'Error, your car could not be saved.'
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer, :model_name, :color, :year, :mileage, :description)
  end
end
