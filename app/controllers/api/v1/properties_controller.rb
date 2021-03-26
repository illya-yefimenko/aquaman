class Api::V1::PropertiesController < ::Api::ApiController
  def update
    @property = Property.find params[:id]

    if @property
      @property.update! property_params
    else
      render json: { error: 'Not found' }, status: :not_found
    end
  end

  def property_params
    params.require(:property).permit :value
  end

end