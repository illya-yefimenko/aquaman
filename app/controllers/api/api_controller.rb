class Api::ApiController < ActionController::API
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :null_session
  before_action :set_default_response_format

  private
  def set_default_response_format
    request.format = :json
  end
end
