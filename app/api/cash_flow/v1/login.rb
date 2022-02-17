class CashFlow::V1::Login < Grape::API
  include CashFlow::V1::Visitor
  
  resource :sessions do

    desc 'Login API' do
      detail "
      Generates auth token with email and password, which should be passed in header for every
      request

      Request paramters:
      'email': Email of user.
      'password': Password of user.
      "
    end

    params do
      requires :email, type: String, desc: 'Email', documentation: { param_type: 'body', post_body: "body" }, default: "", regexp: /.+@.+/
      requires :password, type: String, desc: 'Password',  documentation: { param_type: 'body', post_body: "body"}, default: ""
    end
    
    post '/login', http_codes: [
        { code: 200, message: 'Success', model: CashFlow::V1::Entities::LoginSuccess },
        # { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
        # { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError }
      ] do
      authentication = AuthenticateUser.call(params[:email], params[:password])
      if authentication.success?
        status 200
      	present :auth_token, authentication.result[:token]
        present :message, "Authenticated Successfully"
      else
        status 422
      	present :error_message, authentication.errors[:error].join(", ")
      end
    end
#     desc 'Destroy the access token'
#     params do
#     requires :auth_token, type: String, desc: 'User Access Token'
#     end
#     delete ':auth_token' do
#     auth_token = params[:auth_token]
#     user = User.where(authentication_token: auth_token).first
#     if user.nil?
#     error!({error_code: 404, error_message: 'Invalid access token.'}, 401)
#     return
#     else
#     user.reset_authentication_token
#     {status: 'ok'}
#    end
#  end
end
end



