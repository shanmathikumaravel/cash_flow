module CashFlow::V1::Entities
	class StudentAdmission< Grape::Entity
     #expose :student_admissions_id, documentation: {required:true, type:String, desc: 'student admission id'}
	expose :student_name, documentation: {required: true, type: String, desc: 'student name'}
     expose :DOB, documentation: { required: true, type: String, desc: 'student DOB'}
     expose :gender, documentation: {required: true, type: String, desc: 'gender'}
     expose :email, documentation: { required: true, type: String, desc: 'email'}
     expose :admission_date, documentation: {required: true, type: String, desc: 'admission date'}
     expose :academic_year, documentation: { required: true, type: String, desc: 'academic_year'}
     expose :grade_id, documentation: {required: true, type: String, desc: 'grade id'}
     expose :section, documentation: { required: true, type: String, desc: 'section'}
     expose :previous_school_info, documentation: { required: true, type: String, desc: 'previous school information'}
     expose :father_name, documentation: { required: true, type: String, desc: 'father name of tghe student'}
     expose :father_occupation, documentation: { required: true, type: String, desc: 'father occupation'}
     expose :address, documentation: { required: true, type: String, desc: 'address'}
     expose :phone_number, documentation: { required: true, type: String, desc: 'student phone number'}
     expose :alt_phone_number, documentation: { required: true, type: String, desc: 'student alternative phone number'}
     expose :stu_code, documentation: { required: true, type: String, desc: 'student cose'}
     expose :student_id, documentation: { required: true, type: String, desc: 'student id'}
     expose :status, documentation: { required: true, type: String, desc: 'details of student admission'}
     expose :admission_no, documentation: { required: true, type: String, desc: 'student admission number'}
	end
     # class SearchShaaan < Grape::Entity
     #      expose :student_id do |student_admission|
     #           student_admission.student_payment_info.student_id
     #      end
     #      expose :actual_fees do |student_admission|
     #           "₹#{student_admission.actual_fees}"
     #          end
     #           expose :amount_paid do |student_admission|
     #          "₹#{student_admission.amount_paid}" 
     #           end   
     #           expose :balance do |student_admission|
     #                "₹#{student_admission.actual_fees - student_admission.amount_paid}"
     #           end 
     # end
end