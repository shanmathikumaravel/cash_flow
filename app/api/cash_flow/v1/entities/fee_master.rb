module CashFlow::V1::Entities
	class FeeMaster < Grape::Entity
	   expose :fee_master_id, documentation: {required: true, type: String, desc: 'fee_master_id'}
  	   expose :fee_type_name, documentation: { required: true, type: String, desc: 'fee_type_name'}
       expose :order_id, documentation: { required: true, type: String, desc: 'order_id'}
	end
end
