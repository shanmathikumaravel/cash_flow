module CashFlow::V1::Entities
	class ApiUnauthorizedError < Grape::Entity
		expose :error_code, documentation: { type: Integer, desc: 'status code', example: 401}
  	expose :error_message, documentation: { type: String, desc: 'error message', example: "not authorized"}
	end
end