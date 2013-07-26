class PledgesController < ApplicationController
before_filter :get_projects
before_filter :require_login, :only => :new
	
	def new
		@project = Project.find(params[:project_id])
		@pledge = @project.pledges.new
	end

	def create
		@project = Project.find(params[:project_id])
		@pledge = @project.pledges.new(params[:pledge])

		@pledge.user_id = current_user.id
		@pledge.project_id = @project.id

		if @pledge.save
			redirect_to project_path(@project)
			 flash[:alert] = "Thanks for pledging"
		else
			render "new"
		end
	end

	def get_projects
		@project = Project.find(params[:project_id])
	end
end
