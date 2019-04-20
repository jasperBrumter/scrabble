class Api::V1::BaseController < ActionController::Base
	rescue_from StandardError, with: :internal_server_error

	private

	def internal_server_error(exception)


		if Rails.env.development?
			response = {type: exception.class.to_s, error: exception}
		else 
			response = {error: "Internal Server Error"}
		end
		if exception.class.to_s === "NoMethodError"
			response = {error: "Wrong parameters in API, please refer to our docs on Github"}
		end
		render json: response, status: :internal_server_error
	end
end