class ApplicationController < ActionController::Base
    before_action :set_user

    private

        def set_user
            if session[:user_id]
                @user = UserInfo.find_by(id: session[:user_id])
        end
    end
end
