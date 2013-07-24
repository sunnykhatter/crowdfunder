class SessionsController < ApplicationController

	def create

	 	@user = login(params[:email], params[:password])
	 		if @user
	 			redirect_to root_path
	 		else
	 			flash[:notice] = 'Invalid email/password combination'
	 		 end
	end

   
	def new
		@user = User.new
	end

	def destroy
		logout
		redirect_to root_url
		flash[:alert] = "Bye"

	end


end
