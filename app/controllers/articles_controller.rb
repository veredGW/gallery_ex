require 'yaml'

class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
#     before_action :cors_preflight_check
#     after_action :cors_set_access_control_headers
#
#     def cors_set_access_control_headers
#         headers['Access-Control-Allow-Origin'] = '*'
#         headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
#         headers['Access-Control-Request-Method'] = '*'
#         headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
#     end
#
#     def cors_preflight_check
#         headers['Access-Control-Allow-Origin'] = '*'
#         headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
#         headers['Access-Control-Request-Method'] = '*'
#         headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
#     end
    def index

#        render json: @articles = YAML.load_file(Rails.root.join("db",'airtable_new_copy.yml'))
#        using postgres DB
         @articles = Article.all
         render json: @articles
    end
    def show
#       @one_article = YAML.load_file(Rails.root.join("db",'airtable_new_copy.yml'))
#       @one_article.select! {|article| article["id"] == params[:id] }
#       render json: @one_article[0]
#        using postgres DB
        @article = Article.find(params[:id])
        render json: @article
    end
    def create
        pp 'Inside Post'
# using Postgres DB
        @article = Article.create(
           headline: params[:headline],
           sub_headline: params[:sub_headline],
           header_image: params[:header_image]
          )
        render json: @article
# for yaml
# #         post_req = raw_post()
# #         post_response = {:id => "1234567", :Headline => 'Vered'}
#         post_response = {:id => "reckTySjqh1234567"}
# #         pp params["Sub-headline"]
# #         render json: params
#         all_articles = YAML.load_file(Rails.root.join("db",'airtable_new_copy.yml'))
#         new_article = {
#         "id" => "reckTySjqh1234567",
#         "Headline"=> params[:Headline],
#          "Sub-headline"=>params["Sub-headline"],
#         }
#         all_articles << new_article
# #         pp all_articles
#         output = YAML.dump all_articles
#         File.write(Rails.root.join("db",'airtable_new_copy.yml'), output)
#
#         render json: post_response
# #         @article = params[:headline]
# #         json_response(@article, :created)
# #         pp 'POST'
# #         pp params
    end
    def new
#             pp 'POST'
#             pp params
    end
end
