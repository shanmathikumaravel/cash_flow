module CashFlow::V1::Entities
	class YearOfFee < Grape::Entity
		# expose :year_of_fees_id, documentation: {required: true, type: Integer, desc: 'years fees id '}
        expose :academic_year, documentation: { required: true, type: String, desc: 'academic year'}
  	    expose :grade, documentation: { required: true, type: String, desc: 'grade'}
        expose :fee_master_id, documentation: { required: true, type: Integer, desc: 'fee_amount'}
	end
end
