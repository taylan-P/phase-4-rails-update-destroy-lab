class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  rescue_from ActiveRecord::RecordInvalid, with: :invalid
  

private

  def not_found(error)
    render json: {error:"#{error.model} not found"} , status: :not_found
  end

  def invalid(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

end
