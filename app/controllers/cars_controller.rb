class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car, notice: 'Successfully Created!'
    else
      flash[:notice] = "Could Not Save"
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(
      :name,
      :manufacturer_id,
      :year,
      :color,
      :mileage
      )
  end
end
