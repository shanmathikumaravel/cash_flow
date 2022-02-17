class YearOfFee < ApplicationRecord
    self.table_name = "year_of_fees"
    #validates_uniqueness_of :academic_year, :grade
end
