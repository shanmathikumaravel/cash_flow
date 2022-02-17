require 'grape-swagger'
require 'grape/middleware/logger'

class Api < Grape::API

before do
	#if request.env["REQUEST_PATH"].include?("/v1/swagger_doc")
	#	user = nil
	#	uid = request.env["REQUEST_URI"].to_s.split("?uid=").last
	#	user = User.where(id: uid).last if uid.present?
	#	error!({error_code: 401, error_message: "You don't have access this page"}, 401) if user.blank?
	#end
end

  rescue_from :all, :backtrace => true
  format :json
  content_type :json, 'application/json; charset=utf-8'
  #insert_after Grape::Middleware::Formatter, Grape::Middleware::Logger, {
	 # logger: Logger.new(STDERR),
	  #condensed: true,
	  #filter: Class.new { def filter(opts) opts.reject { |k, _| k.to_s == 'secret_token' } end }.new,
	  #headers: %w(version cache-control)
	#}
	
	mount CashFlow::V1::Base

end