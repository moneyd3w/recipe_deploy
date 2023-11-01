class RecipesController < ApplicationController
    def new
        if session[:user_id].nil?
            redirect_to signin_path, alert: "You must first be logged in to access that page"
        end
    end

    def index
    end
end
