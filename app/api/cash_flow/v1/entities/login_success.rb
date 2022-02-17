module CashFlow::V1::Entities
	class LoginSuccess < Grape::Entity
	expose :auth_token, documentation: {required: true, type: String, desc: 'Auth token'}
  	expose :message, documentation: { required: true, type: String, desc: 'Success message'}
	end
end