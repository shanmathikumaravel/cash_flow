module CashFlow
  module V1
    module Helpers
      module SharedParams
        extend Grape::API::Helpers

        params :pagination do
          optional :page, type: Integer, desc: 'Page - By Default 1', default: 1
          optional :per_page, type: Integer, desc: 'Per page - By Default: 10 records', default: 10
        end
      end
    end
  end
end
        