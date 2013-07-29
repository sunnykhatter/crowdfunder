class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	 def create

 	@project = Project.new(params[:project])
 	@project.user = current_user

 	if @project.save
 		redirect_to my_projects_path
 	else 
 		render 'new'

 	end
 end
end
