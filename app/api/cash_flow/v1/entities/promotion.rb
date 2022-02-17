module CashFlow::V1::Entities
	class Promotion< Grape::Entity
          expose :academic_year,merge: true,expose_nil: false, using:CashFlow::V1::Entities::StudentAdmission
     expose :student_allocation_id, documentation: {required:true, type:String, desc: 'student_allocation_id'}
	expose :student_id, documentation: {required: true, type: String, desc: 'student id'}
     expose :academic_year, documentation: { required: true, type: String, desc: 'academic year'}
     expose :from_grade_id, documentation: {required: true, type: String, desc: 'from grade id'}
     expose :to_grade_id, documentation: { required: true, type: String, desc: 'to grade id'}
     expose :from_section_id, documentation: {required: true, type: String, desc: 'from section id'}
     expose :to_section_id, documentation: { required: true, type: String, desc: 'to section id'}
     expose :student_type, documentation: {required: true, type: String, desc: 'student type'}
     expose :student_admissions_id, documentation: { required: true, type: String, desc: 'year_id generated'}
	end
end