module CashFlow::V1::Entities
	class ApiError < Grape::Entity
		expose :error_code, documentation: { type: Integer, desc: 'error code', example: 500}
  	expose :error_message, documentation: { type: String, desc: 'error message', example: "Internal server error" }
	end
end