class MainController < ApplicationController
  def home
  end

  def add
    if session[:user_id].nil?
      redirect_to signup_path, alert: "You must first be logged in to access that page"
    end
  end
  
  def surprise
  end

  def view
  end
end
