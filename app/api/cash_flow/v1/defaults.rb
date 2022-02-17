module CashFlow
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        prefix "api"
        #ersion "v1", using: :path
        default_format :json
        format :json
        content_type :json, 'application/json'
        #formatter :json, Grape::Formatter::ActiveModelSerializers
        before do
          header['Access-Control-Allow-Origin'] = '*'
          header['Access-Control-Request-Method'] = '*'
        end

        before do          
          required_authentication
        end
        helpers  CashFlow::V1::Helpers::AuthenticationHelper
        helpers  CashFlow::V1::Helpers::CommonHelper

        rescue_from Grape::Exceptions::ValidationErrors do |e|
         #ap e.as_json
         error!({ error_message: e.full_messages.join(",") }, 422)
         #error!(e.as_json, 422)
        end

        #rescue_from ActiveRecord::RecordNotFound do |e|
         # error!({message: e.message, with: Entities::ApiError}, 404)
        #end

        # global exception handler, used for error notifications
        #rescue_from :all do |e|
         # error!({message: "Internal server error: #{e}", with: Entities::ApiError}, 500)
        #end


        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(error_message: e.message, status: 404)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          error_response(error_message: e.message, status: 422)
        end

      end
    end
  end
end