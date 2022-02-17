class CashFlow::V1::StudentPaymentInfo < Grape::API
	include CashFlow::V1::Defaults

	resource :student_payment_info do    
    #----------------------------------
      desc "Search Student Payment Info"
      params do 
        optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
      end
      get '/show all', http_codes: [
        { code: 200, message: 'Success', model: CashFlow::V1::Entities::StudentPaymentInfo},
        { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
        { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
      ]  do
      student_payment_infos = StudentPaymentInfo.all
        present student_payment_infos
      end
    
  
    desc "Create a New Student Payment Info"
    params do
      requires :student_admissions_id, type: Integer, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :fee_master_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :payment_date, type: String, documentation: { param_type: 'body', post_body: "body" }, default:Date.today.strftime("%m/%d/%Y")
      requires :academic_year, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :actual_fees, type: Integer, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :amount_paid, type: Integer, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :payment_mode, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :comments, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      #requires :year_of_fees_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :student_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :grade_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      #requires :fee_type_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      requires :refund, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
      
      optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 
    end
    post '/create', http_codes: [
      { code: 200, message: 'Success', model: CashFlow::V1::Entities::StudentPaymentInfo},
      { code: 422, message: 'Validation Errors', model: CashFlow::V1::Entities::ApiValidationError },
      { code: 500, message: 'Internal Server Error', model: CashFlow::V1::Entities::ApiError}
    ]  do
      StudentPaymentInfo.create({
        student_admissions_id:params[:student_admissions_id],
        fee_master_id:params[:fee_master_id],
        payment_date:params[:payment_date],
        academic_year:params[:academic_year],
        actual_fees:params[:actual_fees],
        amount_paid:params[:amount_paid],
        payment_mode:params[:payment_mode],
        comments:params[:comments],
        year_of_fees_id:params[:year_of_fees_id],
        student_id:params[:student_id],
        grade_id:params[:grade_id],
        #fee_type_id:params[:fee_type_id],
        refund:params[:refund]
        })
      end
    
     desc "Delete an Student Payment Info"
     params do
     requires :student_admissions_id, type: Integer
     optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 

   end
   delete '/' do
  StudentPaymentInfo.find(params[:student_admissions_id]).destroy!
   end
   desc "update an Student Payment Info"
   params do
    #requires :student_payment_info_id, type: Integer, documentation: { param_type: 'body', post_body: "body" }, default: ""
    requires :student_admissions_id, type: Integer, documentation: { param_type: 'body', post_body: "body" }, default: ""
    requires :fee_master_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
    requires :payment_date, type: String, documentation: { param_type: 'body', post_body: "body" }, default:Date.today.strftime("%m/%d/%Y")
    requires :academic_year, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
    requires :actual_fees, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
    requires :amount_paid, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
    requires :payment_mode, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
    requires :comments, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
    requires :year_of_fees_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
    #requires :student_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
    requires :grade_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
    #requires :fee_type_id, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
    requires :refund, type: String, documentation: { param_type: 'body', post_body: "body" }, default: ""
   optional :Authorization, type: String, documentation: { param_type: 'header' }, default: "" 

   end
 put '/update' do
StudentPaymentInfo.find(params[:student_admissions_id]).update({
  student_admissions_id:params[:student_admissions_id],
  fee_master_id:params[:fee_master_id],
  payment_date:params[:payment_date],
  academic_year:params[:academic_year],
  actual_fees:params[:actual_fees],
  amount_paid:params[:amount_paid],
  payment_mode:params[:payment_mode],
  comments:params[:comments],
  #year_of_fees_id:params[:year_of_fees_id],
  #student_id:params[:student_id],
  grade_id:params[:grade_id],
  #fee_type_id:params[:fee_type_id],
  refund:params[:refund]
          
})
  end
end
end



 


