class UsersController < ApplicationController
	def index
	end

	def new 
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			flash[:notice] = "Account created"
			auto_login(@user)
			redirect_to root_path
		else
			flash[:alert] = "Try again"
			render :new
			
			
		end

	end

	 def destroy
    sign_out
    redirect_to root_url
  end

end
