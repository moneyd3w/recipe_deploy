class SessionController < ApplicationController
    def new
    end

    def create
        user = UserInfo.find_by(username: params[:username])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successfully"
        else
            redirect_to signin_path, alert: "Invalid Username or Password"
        end
    end

    def destroy
        session[:user_id] = nil
        @user = nil
        redirect_to root_path, notice: "Logged out"
    end

    def view
        if session[:user_id].nil?
            redirect_to signin_path, alert: "You must first be logged in to access that page"
        elsif UserInfo.find(session[:user_id]).admin?
            redirect_to home_path, alert: "Admins do not have access to this page to avoid account alterations."
        end
        @ingredients = Ingredient.all
    end

    def destroyu   
        @user_list = UserInfo.find(params[:param1])   
        if @user_list.destroy   
          flash[:notice] = 'User deleted'   
          redirect_to home_path   
        else   
            redirect_to account_path, error: 'Failed to delete this account'
        end   
    end 
    
      
end
