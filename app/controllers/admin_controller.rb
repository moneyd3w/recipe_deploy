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
          flash[:notice] = 'User deleted'   
          redirect_to adminuser_path   
        else   
          flash[:error] = 'Failed to delete this user'   
          render :users 
        end   
    end 
    
    def destroyi
        @ingredient_list = Ingredient.find(params[:param1])   
        if @ingredient_list.destroy   
          flash[:notice] = 'Recipe deleted'   
          redirect_to adminingredient_path   
        else   
          flash[:error] = 'Failed to delete this recipe'   
          render :users 
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
            Ingredient.where("username LIKE ?", "%#{name}%")
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