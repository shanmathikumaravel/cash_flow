class StudentAdmissionController < ApplicationController
    def index
        if params[:search_key]
          @student_admissions = StudentAdmission.where("student_name LIKE ? OR description LIKE ?", 
          "%#{params[:search_key]}%", "%#{params[:search_key]}%")
        else
          @student_admissions = StudentAdmission.all
        end
      end
  end