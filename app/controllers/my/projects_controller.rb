class My::ProjectsController < ApplicationController
	 
	 def index
	 		@user = User.find(current_user.id)

	 		@projects = @user.projects
	 end

	 def show

	 end

 def edit
 	 @project = Project.find(params[:id])

 	if current_user.id == @project.user_id
 		@project = Project.find(params[:id])

 	else 
 		redirect_to root_path
 		flash[:alert] = "doesn't exist"
 		
 	end
 	

 end

 def update
 	@project = Project.find(params[:id])

  if @project.update_attributes(params[:project])
    redirect_to my_projects_path
	else
  
   render 'edit'
  	end
 end
		
	def new
		@project = Project.new
	end


end