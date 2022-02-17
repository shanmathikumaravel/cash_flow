module CashFlow
  module V1
    module Helpers
      module CommonHelper

        def get_total_pages_count(total, per_page)
          return (total / per_page) + (total % per_page > 0 ? 1 : 0)
        end
        
      end
    end
  end
end