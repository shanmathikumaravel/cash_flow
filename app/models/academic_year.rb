class AcademicYear < ApplicationRecord
	self.table_name = "years"
	self.primary_key = 'year_id'
	validates_uniqueness_of :academic_year  
	validates :academic_year, presence: true
end