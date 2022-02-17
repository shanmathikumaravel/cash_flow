require 'grape-swagger'

module CashFlow
  module V1
    class Base < Grape::API
      version 'v1', using: :path, format: :json
      mount Login
      mount Student
      mount StudentAdmission
      mount Promotion
      mount YearOfFee
      mount FeeMaster
      mount DiscountTypeMaster
      mount AcademicYear
      mount GradeSection
      mount StudentPaymentInfo
      mount YearOfFee
      add_swagger_documentation :info => {
                                  title: "Web Service Documentation",
                                  description: "Web Service API will help the comunication with iOS, Android and Web FrontEnd.
      Created in March, 2020. "
                                },
                                # :hide_documentation_path => true,
                                 #:mount_path => "/swagger_doc",
                                 #:app_url => 'http://localhost:3000/v1/',

                                 #markdown: GrapeSwagger::Markdown::RedcarpetAdapter,
                                 #:markdown => GrapeSwagger::Markdown::RedcarpetAdapter.new(render_options: { highlighter: :rouge }),
                                 #:markdown => GrapeSwagger::Markdown::KramdownAdapter,
                                 :markdown => Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true),
                                 api_version: 'v1',
                                 format: :json
    end
  end
end
