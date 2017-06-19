class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::RoutingError, with: :error_occurred
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from NameError, with: :error_occurred
  rescue_from StandardError, with: :record_invalid

  private

  def record_not_found(error)
    render json: {error: error.message}, status: :not_found
  end 

  def error_occurred(error)
    render json: { error: error.message }, status: 500
    nil
  end

  def record_invalid(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end
end
