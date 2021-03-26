class Api::V1::DevicesController < ::Api::ApiController
  def show
    @device = Device.find(params[:id])
    render json: {
      id: @device.id.to_s,
      properties: properties_to_json_array(@device.properties)
    }
  end

  private
  def properties_to_json_array(properties)
    json = {}
    properties.each do |property|
      json[property.id.to_s] = {
        id: property.id.to_s,
        value: property.value.to_s
      }
    end
    return json
  end
end