class CashFlow::V1::StudentAdmission < Grape::API
  include CashFlow::V1::Defaults
  helpers CashFlow::V1::Helpers::SharedParams


  resource :students do    
    #----------------------------------
    desc 'User available location API' do
      detail "
        List of locations available for the user, provided with location name and location code

        Request parameter:
        'search': (Optional)Search for any specific location
        'page': (Optional)pagination number. Default: 1
        'per_page': (Optional)Item to be displayed per page. Default: 50
        'Authorization': (Required) Auth token obtained from session API
      "
    end
    params do
      optional :search, type: String
      use :pagination
      optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
    end

    get '/admission', http_codes: [ ] do
      total = StudentAdmission.count
      student_admissions = StudentAdmission.page(params[:page]).per(params[:per_page])
      
      present :status, 200
      present :page, params[:page]
      present :per_page, params[:per_page]      
      present :total_records, total
      present :total_page, get_total_pages_count(total, params[:per_page])
      present :student_admissions, student_admissions
    end
  
    desc "create a new student"
    params do
      #requires :student_admissions_id, type: String
      requires :student_name, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :DOB, type: String, documentation: { param_type: 'body', post_body: "body" }, default:""
      requires :gender, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :email, type: String, documentation: { param_type: 'body', post_body: "body" }, default: "", regexp: /.+@.+/
      requires :admission_date, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :academic_year, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :grade_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :section, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :previous_school_info, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :father_name, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :father_occupation, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :address, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :phone_number, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :alt_phone_number, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :stu_code, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :student_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :status, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :admission_no, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
    end
    post '/new_student' do
    
      StudentAdmission.create({
        student_admissions_id:params[:student_admissions_id],
        student_name:params[:student_name],
        DOB:params[:DOB],
        gender:params[:gender],
        email:params[:email],
        admission_date:params[:admission_date],
        academic_year:params[:academic_year],
        grade_id:params[:grade_id],
        section:params[:section],
        previous_school_info:params[:previous_school_info],
        father_name:params[:father_name],
        father_occupation:params[:father_occupation],
        address:params[:address],
        phone_number:params[:phone_number],
        alt_phone_number:params[:alt_phone_number],
        stu_code:params[:stu_code],
        student_id:params[:student_id],
        status:params[:status],
        admission_no:params[:admission_no]
      })
      end
    
  #    desc "delete an student"
  #    params do
  #    requires :student_admissions_id, type: String
  #    optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
  #  end
   
  #  delete '/delete' do
  #  StudentAdmission.find(params[:student_admissions_id]).destroy!
  #  end
   desc "update student_admissions"
   params do
      requires :student_admissions_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :student_name, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :DOB, type: String, documentation: { param_type: 'body', post_body: "body" }, default: "" 
      requires :gender, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :email, type: String, documentation: { param_type: 'body', post_body: "body" }, default: "", regexp: /.+@.+/
      requires :admission_date, type: String, documentation: { param_type: 'body', post_body: "body" },default: ""
      requires :academic_year, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :grade_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :section, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :previous_school_info, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :father_name, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :father_occupation, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :address, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :phone_number, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :alt_phone_number, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :stu_code, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      #requires :student_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :status, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :admission_no, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 

   end
 put '/update', http_codes: [
  { code: 200, message: 'Success', model: CashFlow::V1::Entities::StudentAdmission},
  { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
  { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
] do

StudentAdmission.find(params[:student_admissions_id]).update({
  student_admissions_id:params[:student_admissions_id],
        student_name:params[:student_name],
        DOB:params[:DOB],
        gender:params[:gender],
        email:params[:email],
        admission_date:params[:admission_date],
        academic_year:params[:academic_year],
        grade_id:params[:grade_id],
        section:params[:section],
        previous_school_info:params[:previous_school_info],
        father_name:params[:father_name],
        father_occupation:params[:father_occupation],
        address:params[:address],
        phone_number:params[:phone_number],
        alt_phone_number:params[:alt_phone_number],
        stu_code:params[:stu_code],
        #student_id:params[:student_id],
        status:params[:status],
        admission_no:params[:admission_no]
})
  end
end
end
