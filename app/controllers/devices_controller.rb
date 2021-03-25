class DevicesController < ApplicationController

  def show
    @device = Device.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: {
        device_id:@device.id.__id__,
        properties: properties_to_json_array(@device.properties) }
      }
    end

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
  def properties_to_json_array(properties)
    json = {}
    properties.each do |property|
    json[property.__id__] = {
      id: property.__id__,
      value: property.value
    }
    end
    return json
  end
end
