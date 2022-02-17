  module Searches
  class StudentAdmission
   search :student_name, type: String do |value|
          student_name,student_id = value.split
    
          scope
            .joins(:profile)
            .where(
              profiles[:student_name].eq(student_name).and(profiles[:student_id].eq(student_id))
            )
        end

    end
end