class SecretsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]
	def index
		@secrets=Secret.all
		# @users_liked=.users_liked
	end

	def create
		user=User.find(params[:userid])
		secret= Secret.create(content:params[:content], user: user)
		if !secret.valid?
			flash[:errors]=secret.errors.full_messages
		end
		redirect_to "/users/#{current_user.id}"
	end

	def destroy
		secret=Secret.find(params[:id])
		secret.destroy if secret.user == current_user
		redirect_to "/users/#{current_user.id}"
	end
end

