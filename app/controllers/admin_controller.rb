class AdminController < ApplicationController
    before_action :require_admin

    def users
        @user_list = filtered_users(params[:param1])
    end

    def ingredients
        @ingredient_list = filtered_ingredient(params[:param1])
    end

    def destroyu   
        @user_list = UserInfo.find(params[:param1])   
        if @user_list.destroy   
          redirect_to adminuser_path, notice: 'User deleted'
        else   
          redirect_to adminuser_path, error: 'Failed to delete this user'   
        end   
    end 
    
    def destroyi
        @ingredient_list = Ingredient.find(params[:param1])   
        if @ingredient_list.destroy   
          redirect_to adminingredient_path, notice: 'Recipe deleted' 
        else   
          redirect_to adminingredient_path, error: 'Failed to delete this recipe'  
        end 
    end

    private

    def filtered_users(username)
        if username.present?
            UserInfo.where("username LIKE ?", "%#{username}%")
        else
            UserInfo.all
        end
    end

    def filtered_ingredient(name)
        if name.present?
            Ingredient.where("name LIKE ?", "%#{name}%")
        else
            Ingredient.all
        end
    end

    def require_admin
        unless session[:user_id] && UserInfo.find(session[:user_id]).admin?
            redirect_to home_path, alert: "ADMIN ACCESS ONLY"
        end
    end
end