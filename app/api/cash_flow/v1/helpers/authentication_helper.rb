module ApiHelpers
  extend Grape::API::Helpers

  Grape::Entity.format_with :utc do |date|
    date.utc if date
  end
end

module CashFlow
  module V1
    module Helpers
      module AuthenticationHelper
        def required_authentication
          unless authenticated
            error!({error_code: 401, error_message: "Session expired. Please login again"}, 401)
            return
          end
        end

        def authenticated
          if decoded_auth_token
            @user ||= User.where(id: decoded_auth_token[:user_id]).last
            unless @user
              error!({error_code: 401, error_message: "Account has been deactivated"}, 401)
            end
          end
          @user
        end

        def decoded_auth_token
          @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
        end

        def http_auth_header
          return headers['Authorization'].present? ? headers['Authorization'] : nil 
        end

        def current_user
          @user
        end
      end
    end
  end
end