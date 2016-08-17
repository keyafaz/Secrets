class LikesController < ApplicationController
	def create
		@like= Like.create(user:current_user, secret: Secret.find(params[:secret_id]))
		redirect_to "/secrets"
	end

	def destroy
		like=Like.find_by(secret:params[:secret_id], user:current_user)
		like.destroy
		redirect_to "/secrets"
	end

end
