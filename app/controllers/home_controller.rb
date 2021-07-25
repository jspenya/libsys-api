class HomeController < ApplicationController
    def index
        @authors = Author.all 
        render json: @authors
    end
end