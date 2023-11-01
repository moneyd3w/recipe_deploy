class RegistrationController < ApplicationController
    def new
        @user_info = UserInfo.new
    end

    def create
        # same forms hash as format
        @user_info = UserInfo.new(user_param)

        # check if saved to database, otherwise back to form
        respond_to do |format|
            if @user_info.save
                session[:user_id] = @user_info.id
                format.html { redirect_to root_path, notice: "Account Created Successfully" }
                #redirect_to root_path, notice: "Account Created Successfully"
            else
                #redirect_to signup_path, alert: "Invalid Username or Password Mismatch. Please Try Again"
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    private

    def user_param
        params.require(:user_info).permit(:username, :password, :password_confirmation)
    end
end