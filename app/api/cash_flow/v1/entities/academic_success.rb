module CashFlow::V1::Entities
	class AcademicSuccess < Grape::Entity
		expose :academic_year, documentation: {required: true, type: String, desc: 'academic year'}
  	expose :year_id, documentation: { required: true, type: String, desc: 'year_id generated'}
	end
end