class CashFlow::V1::AcademicYear < Grape::API
  include CashFlow::V1::Defaults

	resource :academic_year do    
    desc "Search by year_id or academic_year, it renders associated academic_year data"
    params do 
    optional :year_id, type: String, default: ""
    optional :academic_year, type: String, default: ""
    optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
    end
    get '/search', http_codes: [
      { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
      { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
    ]do
     if params[:year_id] or params[:academic_year].present?
        academic_years = AcademicYear.where("year_id = ? OR academic_year= ?", 
        params[:year_id], params[:academic_year]).select(:year_id, :academic_year)
     end 
    end
    

    desc "show all"
    params do 
      optional :Authorization, type: String, documentation: { param_type: 'header' }, default: ""
    end 
    get '/show' do 
      academic_years = AcademicYear.all 
    end 

      desc "Show academic year only"
      params do 
        optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
      end
      get '/show_academic' do
       academic_years = AcademicYear.select(:academic_year)
      end
    desc "Create a New Academic Year"
    params do
      requires :academic_year, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
    end
    post '/' do
      AcademicYear.create({
        academic_year:params[:academic_year]
        })
      end
    
    
      desc "delete an academic_year"
      params do
      requires :year_id, type: String
      optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
    end
    
    delete '/delete' do
    AcademicYear.find(params[:year_id]).destroy!
    end
#    desc "update an Academic Year"
#    params do
#     requires :year_id, type: Integer, documentation: { param_type: 'body', post_body: "body" }, default: ""
#     requires :academic_year, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
#    optional :Authorization, type: String, documentation: { param_type: 'header' }, default: ""
#    end
#  put '/update', http_codes: [
#   { code: 200, message: 'Success', model: CashFlow::V1::Entities::AcademicSuccess},
#   { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
#   { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
# ] do

# AcademicYear.find(params[:year_id]).update({
#   year_id:params[:year_id],
#         academic_year:params[:academic_year]     
# })
#   end
end
end



 