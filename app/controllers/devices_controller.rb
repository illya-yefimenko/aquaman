class DevicesController < ApplicationController

  def show
    @device = Device.find(params[:id])
  end

  def index
    @devices = Device.all
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)

    if @device.save
      redirect_to @device
    else
      render :new
    end
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(device_params)
      redirect_to @device
    else
      render :edit
    end
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy

    redirect_to root_path
  end


  private
  def device_params
    params.require(:device).permit(:name);
  end
end
