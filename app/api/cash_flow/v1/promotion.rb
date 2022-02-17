class CashFlow::V1::Promotion < Grape::API
	include CashFlow::V1::Defaults

	resource :promotion do     
  
      desc "Show all Grade and Section"
      params do 
        optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
      end
      get '/', http_codes: [
        { code: 200, message: 'Success', model: CashFlow::V1::Entities::Promotion},
        { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
        { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
      ] do
        promotion = Promotion.all
        present promotion
      end

      desc "Search by academic_year & grade & section, it renders associated promotion data"
    params do 
    requires :academic_year, type: String, default: ""
    requires :from_grade_id, type: String, default: ""
    requires :from_section_id, type: String, default: ""
    optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
    end
    get '/search by year&grade&section', http_codes: [
      { code: 200, message: 'Success', model: CashFlow::V1::Entities::StudentAdmission},
      { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
      { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
    ]do
     if params[:academic_year] && params[:from_grade_id] && params[:from_section_id].present?
        promotions = Promotion.where("academic_year = ? && from_grade_id = ? && from_section_id = ?", 
        params[:academic_year], params[:from_grade_id], params[:from_section_id]), 
        StudentAdmission.where(academic_year: params[:academic_year], grade_id: params[:from_grade_id], section: params[:from_section_id])
     end 
    end
    desc "Create a New Student Allocation"
    params do
      requires :academic_year, type: String
      requires :from_grade_id, type: String
      requires :from_section_id, type: String 
      requires :to_grade_id, type: String 
      requires :to_section_id, type: String
      requires :student_type, type: String 
      requires :student_admissions_id, type: String 
      requires :student_id, type: String
      optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
    end
    post '/' do
      Promotion.create({
        student_allocation_id:params[:student_allocation_id],
        academic_year:params[:academic_year],
        from_grade_id:params[:from_grade_id],
        from_section_id:params[:from_section_id],
        to_grade_id:params[:to_grade_id],
        to_section_id:params[:to_section_id],
        student_type:params[:student_type],
        student_admissions_id:params[:student_admissions_id],
        student_id:params[:student_id]
        })
      end
   desc "update an Promotion"
   params do
    requires :student_admissions_id, type: Integer, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :academic_year, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :from_grade_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :to_grade_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :from_section_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :to_section_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :student_type, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      #requires :student_allocations_id, type: Integer, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :student_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
   end
 put '/', http_codes: [
  { code: 200, message: 'Success', model: CashFlow::V1::Entities::Promotion},
  { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
  { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
] do
Promotion.find(params[:student_admissions_id]).update({
    student_admissions_id:params[:student_admissions_id],
    academic_year:params[:academic_year], 
    from_grade_id:params[:from_grade_id],   
    to_grade_id:params[:to_grade_id],
    from_section_id:params[:from_section_id], 
    to_section_id:params[:to_section_id], 
    student_type:params[:student_type], 
    #student_allocations_id:params[:student_allocations_id],
    student_id:params[:student_id]  
})
  end
end
end



