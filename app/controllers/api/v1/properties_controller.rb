class Api::V1::PropertiesController < ::Api::ApiController

  def update
    @property = Property.find(params[:property_id])

    if @property
      @property.update! property_params
    else
      render json: { error: 'Not found' }, status: :not_found
    end
  end
  def show
    @property = Property.find(params[:id]);

    if @property
      render json: { value: @property.value }
    end
  end

  def fix_types
    if params[:property][:value]
      params[:property][:value] = params[:property][:value].to_i
    end
  end

  def property_params
    params.require(:property).permit :value
  end

end