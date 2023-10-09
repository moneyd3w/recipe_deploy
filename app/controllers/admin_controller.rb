class AdminController < ApplicationController
    def users
        if session[:user_id].nil? || (!session[:user_id].nil? && !@user.admin?)
            redirect_to home_path, alert: "ADMIN ACCESS ONLY"
        end
    end
end