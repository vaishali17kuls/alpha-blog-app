class ApplicationController < ActionController::Base
  
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   helper_method :current_user, :logged_in?

def current_user
 @current_user ||= User.find(session[:user_id]) if session[:user_id] #return user if it is logged in d seesion
end

def logged_in?
 !!current_user  #tell if he is logged in or not
end

def require_user
 if !logged_in? #if user isnt loggedin
 flash[:danger] = "You must be logged in to perform that action"
 redirect_to root_path
 end
end

end
