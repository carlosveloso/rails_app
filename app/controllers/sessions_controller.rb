class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.where(email: params[:sessions][:email].downcase).first
		if user && user.authenticate(params[:sessions][:password])
			sign_in user
			redirect_to user
		else
			flash.now[:danger] = 'Invalid email/password'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
