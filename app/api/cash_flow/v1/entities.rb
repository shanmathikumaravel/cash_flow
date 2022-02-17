module ApiHelpers
	extend Grape::API::Helpers
  module CashFlow::V1::Entities
	  class StudentPaymentInfo < Grape::Entity
		  with_options(format_with: :indian_rupees) do
			  expose :balance_amount
		  end
  
		  private
			  def balance_amount
				  #balance_amount = StudentPaymentInfo.find(params[actual_fees:]-[amount_paid:])
			  end
	  
			end
	  class StudentPaymentInfo < Grape::Entity
		  expose :balance_amount, documentation: {required:true, type:Integer, desc: 'balance amount'}
	  end
  end
end
