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

    def cors_preflight_check
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
    def index

       render json: @articles = YAML.load_file(Rails.root.join("db",'airtable_new.yml'))
    end
    def show
      @one_article = YAML.load_file(Rails.root.join("db",'airtable_new.yml'))
      @one_article.select! {|article| article["id"] == params[:id] }
      render json: @one_article
    end
end
