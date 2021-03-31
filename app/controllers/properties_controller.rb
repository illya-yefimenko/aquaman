class PropertiesController < ApplicationController
  def create
    @device = find_device(params[:device_id])
    authorize @device, :create_property?
    @property = @device.properties.create(property_params)
    redirect_to device_path(@device)
  end

  def edit
    @property = authorize Property.find(params[:id])
  end

  def update
    @property = authorize Property.find(params[:id])
    @device = @property.device
    if @property.update(property_params)
      redirect_to device_path @device
    else
      render edit
    end
  end

  def destroy
    @property = authorize Property.find(params[:id])
    @device = @property.device
    @property.destroy

    redirect_to device_path @device
  end

  private
  def property_params
    params.require(:property).permit(:name, :unit, :value_type, :io_direction)
  end
  def find_property(device, property_id)
    find_entity(device.properties, property_id)
  end
  def find_device(device_id)
    find_entity(Device, device_id)
  end
  def find_entity(entity, id)
    entity.find(id)
  end
end
