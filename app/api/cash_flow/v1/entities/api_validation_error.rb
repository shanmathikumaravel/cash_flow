module CashFlow::V1::Entities
	class ApiValidationError < Grape::Entity
		expose :error_code, documentation: { type: Integer, desc: 'status code', example: 422}
  	expose :error_message, documentation: { type: Array[String], desc: 'error message', example: "Invalid Token"}
	end
end