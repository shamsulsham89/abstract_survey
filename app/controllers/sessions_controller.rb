class SessionsController < ApplicationController
  def new
  end

  def create
    
    if params[:email].include?('@')
       user = User.find_by_email(params[:email])
    else
       user = User.find_by_username(params[:email])
    end
    
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      if is_admin?
        redirect_to surveys_path, :notice => "Welcome to the Abstract survey administration website"
      else
        redirect_to new_survey_path, :notice => "Welcome #{current_user.full_name} to the survey website"
      end
    else
      flash.now.alert = "email and password combination is invalid"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    #session[:user_id] = nil
    redirect_to root_url, :notice => "Successfully Logout"
  end
end
