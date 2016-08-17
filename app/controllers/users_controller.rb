class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	 before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
	def new
	end

	def show
		@user= current_user 
		@secrets_liked = @user.secrets_liked
		if @user== nil
			flash[:errors]=["You are not logged in"]
			redirect_to "/sessions/new"
		end
	end

	def create
		user=User.create(name:params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
		if user.valid?
			session[:user_id]= user.id
			redirect_to "/users/#{user.id}"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to "/users/new"
		end
	end

	def edit
		@user= User.find(params[:id])
	end

	def update
		user= User.find(params[:id])
		
		if user.update(name:params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
			redirect_to "/users/#{user.id}"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to "/users/#{user.id}/edit"
		end
	end

	def destroy
		user=User.find(params[:id])
		user.destroy
		session.clear
		redirect_to '/sessions/new'
	end

end
