module CashFlow::V1::Entities
	class DiscountTypeMaster < Grape::Entity
		expose :dis_feetype_name, documentation: {required: true, type: String, desc: 'discount type master'}
  	expose :dis_feetype_id, documentation: { required: true, type: String, desc: 'discount feetype id'}
end
end