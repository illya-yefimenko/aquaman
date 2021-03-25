class PropertiesController < ApplicationController
  def create
    @device = Device.find(params[:device_id])
    @property = @device.properties.create(property_params)
    redirect_to device_path(@device)
  end

  def edit
  end

  def update
  end

  def destroy
    @device = Device.find(params[:device_id])
    @property = @device.properties.find(params[:id])
    @property.destroy

    redirect_to device_path(@device)
  end

  private
  def property_params
    params.require(:property).permit(:name, :unit, :value_type, :io_direction)
  end
end
