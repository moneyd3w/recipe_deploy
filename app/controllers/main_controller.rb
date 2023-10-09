class MainController < ApplicationController
  def home
    if session[:user_id]
      @user = UserInfo.find(session[:user_id])
    end
  end

  def add
  end

  def surprise
  end

  def view
  end

  def login
    flash[:notice] = "logged in successfully"
    flash[:alert] = "Invalid username/password"
  end
end
