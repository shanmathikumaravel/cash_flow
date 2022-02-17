module CashFlow::V1::Entities
	class StudentAdmissionSearch< Grape::Entity
        expose :student_admissions_id,merge: true,expose_nil: false, using:CashFlow::V1::Entities::Promotion
	expose :student_id,merge: true,expose_nil: false, using:CashFlow::V1::Entities::StudentPaymentInfo
        expose :year_of_fees_id,merge: true,expose_nil: false, using:CashFlow::V1::Entities::YearOfFee
     expose :student_admissions_id, documentation: {required:true, type:String, desc: 'student admission id'}
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
     expose :stu_code, documentation: { required: true, type: String, desc: 'student code'}
     expose :student_id, documentation: { required: true, type: String, desc: 'student id'}
     expose :status, documentation: { required: true, type: String, desc: 'details of student admission'}
     expose :admission_no, documentation: { required: true, type: String, desc: 'student admission number'}
	end
       
end