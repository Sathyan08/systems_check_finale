class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def show

  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufactuer.save
      redirect_to @manufactuer, notice: 'Successfully Created'
    else
      flash[:notice] = "Could Not Save"
      render :new
    end
  end

  def edit

  end

end
