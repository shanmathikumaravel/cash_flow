module CashFlow::V1::Entities
	class GradeSection < Grape::Entity
	   expose :grade_section_id, documentation: {required: true, type: String, desc: 'grade section id'}
  	   expose :grade, documentation: { required: true, type: String, desc: 'grade'}
       expose :section, documentation: { required: true, type: String, desc: 'section'}
	end
end
