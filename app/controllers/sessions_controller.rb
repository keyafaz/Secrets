class SessionsController < ApplicationController
	def new
	end

	def login
		@user= User.find_by_email(params[:email])
		if @user and @user.authenticate(params[:password])
			session[:user_id]= @user.id
			redirect_to "/users/#{@user.id}"
		else
			flash[:errors] = ["Invalid combination"]
			redirect_to "/sessions/new"
		end
	end

	def logout
		session.clear
		redirect_to "/sessions/new"
	end

end
