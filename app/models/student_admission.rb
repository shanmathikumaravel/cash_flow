class StudentAdmission < ApplicationRecord
	self.table_name = "student_admissions"
    self.primary_key = "student_admissions_id"
  
    # validates :student_name, length: { minimum: 2 }
    # validates :gender, length: { minimum: 3 }
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates_uniqueness_of :email 
    validates_uniqueness_of :phone_number 
    validates_uniqueness_of :student_id 
    validates_uniqueness_of :admission_no
    # validates :section, length: { minimum: 1 }
    # validates :previous_school_info, length: { minimum: 10 }
    # validates :father_name, length: { minimum: 2 }
    # validates :father_occupation, length: { minimum: 3 }
    # validates :address, length: { minimum: 10 }
    # validates :phone_number, length: { minimum: 10 }
end
