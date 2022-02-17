class CashFlow::V1::GradeSection < Grape::API
	include CashFlow::V1::Defaults

	resource :grade_section do     
    desc "Search by grade_section_id or grade or section, it renders associated grade_section data"
    params do 
    optional :grade_section_id, type: String, default: ""
    optional :grade, type: String, default: ""
    optional :section, type: String, default: ""
    optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
    end
    get '/search', http_codes: [
      { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
      { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
    ]do
     if params[:grade_section_id] or params[:grade] or [:section].present?
        grade_sections = GradeSection.where("grade_section_id = ? OR grade = ? OR section = ?", 
        params[:grade_section_id], params[:grade], params[:section])
     end 
    end
  
      desc "Show all Grade and Section"
      params do 
        optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
      end
      get '/show all', http_codes: [
        { code: 200, message: 'Success', model: CashFlow::V1::Entities::GradeSection},
        { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
        { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
      ] do
        grade_section = GradeSection.all
        present grade_section
      end

      desc "Show all grade"
      params do         
        optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
      end
      get '/show grade only' do
      grade_section = GradeSection.select(:grade)
      end

      desc "Show all section"
      params do         
        optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
      end
      get '/show section only' do
      grade_section = GradeSection.select(:section)
      end

      desc "Show Grade and Section"
      params do    
        optional :grade, type: String, default: ""
        optional :section, type: String, default: ""  
        optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
      end
      get '/show Grade and Section', http_codes: [
      #{ code: 200, message: 'Success', model: CashFlow::V1::Entities::GradeSection},
      { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
      { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
    ]do
    if params[:grade] or [:section].present?
      grade_sections = GradeSection.where(" grade = ? && section = ?",params[:grade], params[:section])
   end 
    end

    params do    
      optional :grade, type: String, default: ""
      optional :section, type: String, default: ""  
      optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
    end
    get '/show Grade or Section', http_codes: [
      #{ code: 200, message: 'Success', model: CashFlow::V1::Entities::GradeSection},
      { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
      { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
    ]do
    if params[:grade] or [:section].present?
      grade_sections = GradeSection.where(" grade = ? OR section = ?",params[:grade], params[:section])
   end 
    end
  





    desc "Create a New Grade and Section"
    params do
      requires :grade, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :section, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      
      optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
    end
    post '/create', http_codes: [
      { code: 200, message: 'Success', model: CashFlow::V1::Entities::GradeSection},
      { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
      { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
    ] do
      GradeSection.create({
        grade:params[:grade],
        section:params[:section]
        })
      
      end
    
     desc "Delete an Grade section"
     params do
     requires :id, type: String
     optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 

   end
   delete '/' do
    GradeSection.find(params[:id]).destroy!
   end
   desc "update an Grade Section"
   params do
      requires :grade_section_id, type: Integer, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :grade, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :section, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
   optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
   end
 put '/update', http_codes: [
  { code: 200, message: 'Success', model: CashFlow::V1::Entities::GradeSection},
  { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
  { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
] do
GradeSection.find(params[:grade_section_id]).update({
  grade_section_id:params[:grade_section_id],
  grade:params[:grade],   
  section:params[:section]  
})
  end
end
end



