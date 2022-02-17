class Promotion < ApplicationRecord
    self.table_name = "student_allocations" 
    self.primary_key = "student_admissions_id"
end
