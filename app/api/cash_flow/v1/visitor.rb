module CashFlow
  module V1
    module Visitor
      extend ActiveSupport::Concern

      included do
        prefix "api"
        #ersion "v1", using: :path
        default_format :json
        content_type :json, 'application/json'
        format :json
        #formatter :json, Grape::Formatter::ActiveModelSerializers

        rescue_from :all do |e|
          error!({error_message: "Internal server error: #{e}", error_code: 500, with: Entities::ApiError}, 500)
        end

        #rescue_from ActiveRecord::ConnectionTimeoutError do |e|
          #error!({message: "Internal server error: #{e}", error_code: 500, with: Entities::ApiError}, 500)
        #end

        rescue_from Grape::Exceptions::ValidationErrors do |e|
         #ap e.as_json
         #error!(e.as_json, 422)
         error!({ error_message: e.full_messages.join(", "), error_code: 422 }, 422)
        end

        before do
          header['Access-Control-Allow-Origin'] = '*'
          header['Access-Control-Request-Method'] = '*'
        end
      end
    end
  end
end
