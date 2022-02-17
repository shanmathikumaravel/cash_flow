class StudentPaymentInfo < ApplicationRecord
    self.table_name = "student_payment_infos"
    self.primary_key = "student_admissions_id"
    belongs_to :student_admission
    

end
