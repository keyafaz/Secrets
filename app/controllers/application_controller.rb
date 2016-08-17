class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def require_login
    redirect_to '/sessions/new' if session[:user_id] == nil
  end

  def require_correct_user
    user = User.find(params[:id])
    redirect_to "/users/#{current_user.id}" if current_user != user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
	
	# def loggedin?
 #  		if  !session.has_key?(:user_id)
 #    		redirect_to "/sessions/new"
 #    		return
 # 		end
 # 	end
 	
end

