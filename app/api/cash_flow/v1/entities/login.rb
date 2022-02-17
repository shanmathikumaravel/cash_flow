module CashFlow::V1::Entities
	class Login < Grape::Entity
		expose :access_token, documentation: { type: String, desc: 'User access token', required: true}
  	expose :secret_token, documentation: { type: String, desc: 'User secret token', required: true}
	end
end