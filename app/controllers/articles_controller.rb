require 'yaml'

class ArticlesController < ApplicationController
before_action :cors_preflight_check
after_action :cors_set_access_control_headers


def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
end

# If this is a preflight OPTIONS request, then short-circuit the
# request, return only the necessary headers and return an empty
# text/plain.

def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
#     render :text => '', :content_type => ''
end
  def index
#      thing = YAML.load_file('../../../db/airtable.yml')
#       puts thing.inspect
      @articles_old = YAML.load("---
                             - id: rec6823jPx5NfuCPL
                               fields:
                                 Headline: 'Interview: Carlos Richardson''s Mt. Kilimanjaro adventure'
                                 Sub-headline: The fearless explorer tells all about his volcanic climb
                                 HeaderImage: https://dl.airtable.com/.attachments/6be902074d1b866444e3a3cbd08beda9/0fe5e344/kilimanjaro-1203937_1280.jpg
")
       render json: @articles = YAML.load_file(Rails.root.join("db",'airtable.yml'))
#       puts @articles.inspect
  end
  def show
      @one_articles = YAML.load_file(Rails.root.join("db",'airtable.yml'))
      @one_articles.select! {|article| article["id"] == params[:id] }
      render json: @one_articles
    end
end
